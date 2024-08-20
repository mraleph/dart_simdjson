// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#include "capi.h"

#include <charconv>
#include <chrono>
#include <cstdio>
#include <ranges>

#include "third_party/ankerl_unordered_dense/unordered_dense.h"
#include "third_party/simdjson/simdjson.h"

using namespace simdjson;

#define RETURN_IF_ERROR(expr, ...)                        \
  do {                                                    \
    auto error = (expr);                                  \
    if (error) {                                          \
      set_error(__FUNCTION__, __FILE__, __LINE__, error); \
      return __VA_ARGS__;                                 \
    }                                                     \
  } while (0)

#define RETURN_IF_ERROR2(expr, p, ...)                      \
  do {                                                      \
    auto error = (expr);                                    \
    if (error) {                                            \
      p.set_error(__FUNCTION__, __FILE__, __LINE__, error); \
      return __VA_ARGS__;                                   \
    }                                                       \
  } while (0)

template <typename T>
T& Slot(uint8_t* storage, FieldDescriptor desc) {
  return *reinterpret_cast<T*>(storage + desc.offset);
}

static_assert(sizeof(FieldDescriptor) <= 8, "Expected to fit into 8 bytes");

class ObjectLayoutDescriptor;
class ArrayLayoutDescriptor;

// Layout descriptor for an object or array which can be read from JSON.
class LayoutDescriptor {
 public:
  virtual ~LayoutDescriptor() {}

  enum class Kind { kObject, kArray };

  Kind kind() const { return kind_; }

  ObjectLayoutDescriptor* AsObjectLayout();
  const ObjectLayoutDescriptor* AsObjectLayout() const;
  ArrayLayoutDescriptor* AsArrayLayout();
  const ArrayLayoutDescriptor* AsArrayLayout() const;

 protected:
  explicit LayoutDescriptor(Kind kind) : kind_(kind) {}

 private:
  const Kind kind_;
};

static size_t AlignTo(size_t v, size_t power_of_two) {
  const auto mask = power_of_two - 1;
  return (v + mask) & ~mask;
}

class ObjectLayoutDescriptor : public LayoutDescriptor {
 public:
  // This allows to perform look ups with std::string_view without copying
  // bytes out into a fresh string.
  struct TransparentStringViewHash {
    using is_transparent = void;
    using is_avalanching = void;

    [[nodiscard]] auto operator()(std::string_view str) const noexcept
        -> uint64_t {
      return ankerl::unordered_dense::hash<std::string_view>{}(str);
    }
  };

  using FieldsMap = ankerl::unordered_dense::map<std::string,
                                                 FieldDescriptor,
                                                 TransparentStringViewHash,
                                                 std::equal_to<>>;

  static ObjectLayoutDescriptor* FromFields(
      std::string_view names,
      const FieldDescriptor* descriptors) {
    FieldsMap fields;

    uint8_t used_presence_bits = 0;
    size_t size = 0;
    auto field = descriptors;
    for (const auto& e : std::views::split(names, ',')) {
      fields[std::string{e.begin(), e.end()}] = *field;
      used_presence_bits = std::max(field->presence_bit, used_presence_bits);
      size =
          std::max(AlignTo(field->offset + SizeOfField(field->type), 8), size);
      field++;
    }

    const auto header_size = AlignTo(used_presence_bits, 64) >> 3;

    // Note this is currently an unlinked descriptor, e.g. its references
    // for descriptors of nested types are not yet filled in.
    return new ObjectLayoutDescriptor(size, header_size, std::move(fields));
  }

  void Link(LayoutDescriptor** nested) { nested_ = nested; }

  size_t size() const { return size_; }
  size_t header_size() const { return header_size_; }
  LayoutDescriptor* nested(int16_t index) const { return nested_[index]; }

  const FieldsMap& fields() const { return fields_; }

  virtual ~ObjectLayoutDescriptor() { free(nested_); }

 private:
  ObjectLayoutDescriptor(size_t size, size_t header_size, FieldsMap&& fields)
      : LayoutDescriptor(Kind::kObject),
        size_(size),
        header_size_(header_size),
        fields_(fields) {}

  static size_t SizeOfField(FieldType type) {
    return (kSizesOfFieldTypes >> (static_cast<int>(type) * 4)) & 0xF;
  }

  const size_t size_;
  const size_t header_size_;
  const FieldsMap fields_;
  LayoutDescriptor** nested_ = nullptr;
};

class ArrayLayoutDescriptor : public LayoutDescriptor {
 public:
  ArrayLayoutDescriptor(FieldType element_type,
                        bool is_optional,
                        LayoutDescriptor* element_layout)
      : LayoutDescriptor(Kind::kArray),
        element_type_(element_type),
        is_optional_(is_optional),
        element_layout_(element_layout) {}

  FieldType element_type() const { return element_type_; }
  bool is_optional() const { return is_optional_; }

  const LayoutDescriptor* element_layout() const { return element_layout_; }

 private:
  const FieldType element_type_;
  const bool is_optional_;
  const LayoutDescriptor* element_layout_ = nullptr;
};

ObjectLayoutDescriptor* LayoutDescriptor::AsObjectLayout() {
  assert(kind() == Kind::kObject);
  return static_cast<ObjectLayoutDescriptor*>(this);
}
const ObjectLayoutDescriptor* LayoutDescriptor::AsObjectLayout() const {
  assert(kind() == Kind::kObject);
  return static_cast<const ObjectLayoutDescriptor*>(this);
}
ArrayLayoutDescriptor* LayoutDescriptor::AsArrayLayout() {
  assert(kind() == Kind::kArray);
  return static_cast<ArrayLayoutDescriptor*>(this);
}
const ArrayLayoutDescriptor* LayoutDescriptor::AsArrayLayout() const {
  assert(kind() == Kind::kArray);
  return static_cast<const ArrayLayoutDescriptor*>(this);
}

// Simple arena allocator for mananging memory allocated by the message parser.
//
// Owns a list of 64K chunks and uses bump allocation into the last chunk.
// Chunks are allocated by malloc. All chunks are freed when |Arena| is
// destroyed.
class Arena {
 public:
  Arena() { Expand(); }

  // Allocate |size| bytes from this arena.
  //
  // Result is guaranteed to be aligned by |kDefaultAlignment|.
  uint8_t* Allocate(size_t size) {
    // Align the size to kDefaultAlignment.
    size = (size + kDefaultAlignment - 1) & ~(kDefaultAlignment - 1);

    size_ += size;
    if (size > kChunkSize) {
      return AllocateChunk(size);
    }

    // Check if we need to grow this arena. Left over space in the current
    // chunk is wasted for simplicity.
    if (current_ + size > top_) {
      Expand();
    }

    auto result = current_;
    current_ += size;
    return result;
  }

  template <typename T>
  T* Create() {
    void* ptr = Allocate(sizeof(T));
    return new (ptr) T();
  }

  // Returns total size of objects allocated in this arena.
  size_t size() const { return size_; }

 private:
  static constexpr size_t kChunkSize = 64 * 1024;
  static constexpr size_t kDefaultAlignment = 8;

  struct FreeDeleter {
    void operator()(void* const ptr) const { free(ptr); }
  };

  template <typename T>
  using MallocUniquePtr = std::unique_ptr<T, FreeDeleter>;

  void Expand() {
    current_ = AllocateChunk(kChunkSize);
    top_ = current_ + kChunkSize;
  }

  uint8_t* AllocateChunk(size_t size) {
    auto chunk = MallocUniquePtr<uint8_t>(static_cast<uint8_t*>(malloc(size)));
    chunks_.push_back(std::move(chunk));
    return chunks_.back().get();
  }

  uint8_t* current_;
  uint8_t* top_;
  size_t size_ = 0;
  std::vector<MallocUniquePtr<uint8_t>> chunks_;
};

// JsonParser which interprets TypeDescriptors to inflate JSON into
// objects.
class JsonParser {
 public:
  JsonParser(Arena& arena) : arena_(arena) {}

  uint8_t* DoParse(const char* input_data,
                   size_t size,
                   const LayoutDescriptor* desc) {
    ondemand::parser parser;
    ondemand::document doc;

    RETURN_IF_ERROR(
        parser.iterate(input_data, size, size + SIMDJSON_PADDING).get(doc),
        nullptr);

    ondemand::value root;
    RETURN_IF_ERROR(doc.get(root), nullptr);

    return ParseRecursively(root, desc);
  }

  uint8_t* ParseRecursively(ondemand::value v, const LayoutDescriptor* layout) {
    if (layout->kind() == LayoutDescriptor::Kind::kObject) {
      ondemand::object o;
      RETURN_IF_ERROR(v.get(o), nullptr);
      return ParseObjectRecursively(o, layout->AsObjectLayout());
    } else {
      ondemand::array a;
      RETURN_IF_ERROR(v.get(a), nullptr);
      return ParseArrayRecursively(a, layout->AsArrayLayout());
    }
  }

  char* error() { return error_; }

 private:
  // `FieldTrait` captures how the field is parsed and stored into the result.
  //
  // Primitive fields (`int64_t` and `double`) are parsed and stored
  // in the same value. They don't need any convertion.
  template <typename T>
  struct FieldTrait {
    using StorageType = T;
    using ParseType = T;

    static StorageType Convert(JsonParser&, ParseType v) { return v; }
  };

  // `FieldTrait` specialization for `kString` fields.
  //
  // These need to be copied out of the JSON parser into the arena.
  template <>
  struct FieldTrait<const char*> {
    using StorageType = const char*;
    using ParseType = std::string_view;

    static StorageType Convert(JsonParser& p, ParseType v) {
      auto copied = p.arena_.Allocate(v.size() + 1);
      memcpy(copied, v.begin(), v.size());
      copied[v.size()] = '\0';
      return reinterpret_cast<const char*>(copied);
    }
  };

  // `FieldTrait` specialization for `kBool` fields.
  //
  // These are stored as `uint8_t` values.
  template <>
  struct FieldTrait<bool> {
    using StorageType = int8_t;
    using ParseType = bool;

    static StorageType Convert(JsonParser&, ParseType v) { return v; }
  };

  // `FieldParser` decodes content of the `ondemand::value` into the given
  // slot for the field of type `FieldType`.
  //
  // By default it applies the convertion from the `ParseType` to `StorageType`
  // as prescribed by the `FieldTrait`.
  template <typename FieldType, typename Enable = void>
  struct FieldParser {
    bool ParseInto(JsonParser& p,
                   ondemand::value v,
                   FieldTrait<FieldType>::StorageType& slot) {
      typename FieldTrait<FieldType>::ParseType result;
      RETURN_IF_ERROR2(v.get(result), p, false);
      slot = FieldTrait<FieldType>::Convert(p, result);
      return true;
    }
  };

  // `FieldParser` specialization for handling fields which don't require
  // covnertion from `ParseType` to `StorageType` (e.g. `int64_t` and `double`).
  template <typename FieldType>
  struct FieldParser<
      FieldType,
      typename std::enable_if<std::is_same<
          typename FieldTrait<FieldType>::StorageType,
          typename FieldTrait<FieldType>::ParseType>::value>::type> {
    bool ParseInto(JsonParser& p,
                   ondemand::value v,
                   FieldTrait<FieldType>::StorageType& slot) {
      RETURN_IF_ERROR2(v.get(slot), p, false);
      return true;
    }
  };

  // `FieldParser` specialization for handling compound fields which
  // need to be interpreted using specific `layout`.
  template <>
  struct FieldParser<uint8_t*> {
    const LayoutDescriptor* layout;

    bool ParseInto(JsonParser& p, ondemand::value v, uint8_t*& slot) {
      auto obj = p.ParseRecursively(v, layout);
      if (obj == nullptr) {
        return false;
      }
      slot = obj;
      return true;
    }
  };

  // Code for loading arrays from JSON.
  //
  // These are are represented as a linked list of `kArrayChunkSize` long
  // chunks

  // A chunk of an array.
  template <bool kAllowsNull, typename StorageType>
  struct ArrayChunk;

  // Specialization for array chunks which can contain optional values.
  //
  // It has a dedicated `presence` bit vector for marking entries as
  // present.
  template <typename StorageType>
  struct ArrayChunk<true, StorageType> {
    ArrayChunk() {}

    void MarkPresent(size_t index) {
      presence |= (1L << (index & (kArrayChunkSize - 1)));
    }

    uint64_t presence = 0;
    StorageType elements[kArrayChunkSize];
    ArrayChunk* next = nullptr;
  };

  // Specialization for array chunks which can't contain optional values.
  template <typename StorageType>
  struct ArrayChunk<false, StorageType> {
    void MarkPresent(size_t index) {}

    StorageType elements[kArrayChunkSize];
    ArrayChunk* next = nullptr;
  };

  // Head of the array.
  template <bool kAllowsNull, typename StorageType>
  struct ArrayHead {
    uint64_t length;
    ArrayChunk<kAllowsNull, StorageType> chunk;
  };

  // Helper for building array dynamically.
  template <bool kAllowsNull, typename StorageType>
  struct ArrayBuilder {
    ArrayBuilder(Arena& arena) : arena(arena) {}

    void MarkPresent() { current->MarkPresent(length - 1); }

    // Reserve space for the next element.
    //
    // Note: that does not mean the element will be present. If `kAllowsNull`
    // is `true` then this element is only present if is marked as present.
    StorageType& ReserveSpace() {
      const auto index_in_chunk = length & (kArrayChunkSize - 1);
      if (index_in_chunk == 0) {
        Expand();
      }
      length++;
      return current->elements[index_in_chunk];
    }

    // Finish array.
    uint8_t* Finish() {
      if (length == 0) {
        auto result = arena.Create<int64_t>();
        *result = 0;
        return reinterpret_cast<uint8_t*>(result);
      }
      head->length = length;
      return reinterpret_cast<uint8_t*>(head);
    }

    // Add one more chunk to the array.
    void Expand() {
      if (head == nullptr) {
        head = arena.Create<ArrayHead<kAllowsNull, StorageType>>();
        current = &head->chunk;
      } else {
        auto next = arena.Create<ArrayChunk<kAllowsNull, StorageType>>();
        current->next = next;
        current = next;
      }
    }

    Arena& arena;

    ArrayChunk<kAllowsNull, StorageType>* current = nullptr;
    ArrayHead<kAllowsNull, StorageType>* head = nullptr;
    size_t length = 0;
  };

  template <bool kAllowsNull, typename ElementType>
  uint8_t* ParseArrayElements(ondemand::array a, FieldParser<ElementType> p) {
    ArrayBuilder<kAllowsNull, typename FieldTrait<ElementType>::StorageType>
        builder(arena_);
    for (auto maybe_ev : a) {
      ondemand::value ev;
      RETURN_IF_ERROR(maybe_ev.get(ev), nullptr);
      auto& slot = builder.ReserveSpace();
      if (kAllowsNull) {
        bool is_null;
        RETURN_IF_ERROR(ev.is_null().get(is_null), nullptr);
        if (is_null) {
          continue;
        }
      }
      if (!p.ParseInto(*this, ev, slot)) {
        set_error(__FUNCTION__, __FILE__, __LINE__,
                  "unabled to parse array element");
        return nullptr;
      }
      builder.MarkPresent();
    }
    return builder.Finish();
  }

  template <typename ElementType>
  uint8_t* ParseArray(ondemand::array a,
                      bool can_element_be_null,
                      FieldParser<ElementType> p) {
    if (can_element_be_null) {
      return ParseArrayElements</*kAllowNull=*/true, ElementType>(a, p);
    } else {
      return ParseArrayElements</*kAllowNull=*/false, ElementType>(a, p);
    }
  }

  uint8_t* ParseArrayRecursively(ondemand::array a,
                                 const ArrayLayoutDescriptor* desc) {
    switch (desc->element_type()) {
      case FieldType::kCompound:
        return ParseArray<uint8_t*>(a, desc->is_optional(),
                                    {desc->element_layout()});

      case FieldType::kInt64:
        return ParseArray<int64_t>(a, desc->is_optional(), {});

      case FieldType::kDouble:
        return ParseArray<double>(a, desc->is_optional(), {});

      case FieldType::kBool:
        return ParseArray<bool>(a, desc->is_optional(), {});

      case FieldType::kString:
        return ParseArray<const char*>(a, desc->is_optional(), {});
    }
    abort();
    return nullptr;
  }

  template <typename FieldType>
  bool ParseOneFieldImpl(ondemand::value v,
                         FieldDescriptor field_desc,
                         FieldParser<FieldType> p,
                         uint8_t* result) {
    return p.ParseInto(
        *this, v,
        Slot<typename FieldTrait<FieldType>::StorageType>(result, field_desc));
  }

  bool ParseOneFieldInto(ondemand::value v,
                         FieldDescriptor field_desc,
                         uint8_t* result,
                         const ObjectLayoutDescriptor* layout) {
    if (field_desc.presence_bit != 0) {
      bool is_null = false;
      RETURN_IF_ERROR(v.is_null().get(is_null), false);

      if (is_null) {
        return true;
      }

      // Mark the bit as present.
      const int presence_bit_index = field_desc.presence_bit - 1;
      const auto cell_index = presence_bit_index >> 6;
      const auto bit_index = presence_bit_index & 63;
      reinterpret_cast<uint64_t*>(result)[cell_index] |= 1 << bit_index;
    }

    switch (field_desc.type) {
      case FieldType::kCompound:
        return ParseOneFieldImpl<uint8_t*>(
            v, field_desc, {layout->nested(field_desc.descriptor_index)},
            result);

      case FieldType::kInt64:
        return ParseOneFieldImpl<int64_t>(v, field_desc, {}, result);

      case FieldType::kDouble:
        return ParseOneFieldImpl<double>(v, field_desc, {}, result);

      case FieldType::kBool:
        return ParseOneFieldImpl<bool>(v, field_desc, {}, result);

      case FieldType::kString:
        return ParseOneFieldImpl<const char*>(v, field_desc, {}, result);
    }

    return false;
  }

  uint8_t* ParseObjectRecursively(ondemand::object o,
                                  const ObjectLayoutDescriptor* layout) {
    auto result = arena_.Allocate(layout->size());

    // Zero initialize any presence bits.
    if (layout->header_size() > 0) {
      memset(result, 0, layout->header_size());
    }

    const auto& fields = layout->fields();

    // Fast path for an empty layout and layout with 1 field.
    if (fields.size() == 0) {
      return result;
    } else if (fields.size() == 1) {
      auto it = fields.begin();
      ondemand::value v;
      if (!o[it->first].get(v)) {
        if (!ParseOneFieldInto(v, it->second, result, layout)) {
          set_error(__FUNCTION__, __FILE__, __LINE__, "unabled to parse field");
          return nullptr;
        }
        return result;
      }
      if (it->second.presence_bit == 0) {
        // A field which is supposed to be present is absent.
        set_error(__FUNCTION__, __FILE__, __LINE__, "missing required field");
        return nullptr;
      }
      return result;
    }

    // Handle all fields.
    for (auto field : o) {
      std::string_view key;
      RETURN_IF_ERROR(field.escaped_key().get(key), nullptr);

      auto desc = fields.find(key);
      if (desc != fields.end()) {
        ondemand::value v;
        RETURN_IF_ERROR(field.value().get(v), nullptr);
        if (!ParseOneFieldInto(v, desc->second, result, layout)) {
          set_error(__FUNCTION__, __FILE__, __LINE__, "failed to parse field");
          return nullptr;
        }
      }
    }
    return result;
  }

  void set_error(const char* function,
                 const char* file,
                 intptr_t line,
                 simdjson::error_code simdjson_error) {
    if (error_ != nullptr) {
      return;
    }

    int n = snprintf(nullptr, 0, "parsing error: %s (in %s at %s:%ld)\n",
                     error_message(simdjson_error), function, file, line);
    char* buf = reinterpret_cast<char*>(arena_.Allocate(n + 1));
    snprintf(buf, n + 1, "parsing error: %s (at %s:%ld)\n",
             error_message(simdjson_error), file, line);
    error_ = buf;
  }

  void set_error(const char* function,
                 const char* file,
                 intptr_t line,
                 const char* message) {
    if (error_ != nullptr) {
      return;
    }

    int n = snprintf(nullptr, 0, "parsing error: %s (in %s at %s:%ld)\n",
                     message, function, file, line);
    char* buf = reinterpret_cast<char*>(arena_.Allocate(n + 1));
    snprintf(buf, n + 1, "parsing error: %s (at %s:%ld)\n", message, file,
             line);
    error_ = buf;
  }

  Arena& arena_;
  char* error_ = nullptr;
};

extern "C" Arena* simdjson_arena_create() {
  return new Arena();
}

extern "C" void simdjson_arena_release(Arena* arena) {
  delete arena;
}

extern "C" LayoutDescriptor* simdjson_descriptor_create_object(
    const uint8_t* data,
    uint32_t num_fields) {
  auto descriptors = reinterpret_cast<const FieldDescriptor*>(data);
  auto names = reinterpret_cast<const char*>(descriptors + num_fields);
  return ObjectLayoutDescriptor::FromFields(names, descriptors);
}

extern "C" LayoutDescriptor* simdjson_descriptor_create_array(
    FieldType element_type,
    bool is_optional,
    LayoutDescriptor* element_layout) {
  return new ArrayLayoutDescriptor(element_type, is_optional, element_layout);
}

extern "C" void simdjson_descriptor_link(LayoutDescriptor* desc,
                                         LayoutDescriptor** nested) {
  desc->AsObjectLayout()->Link(nested);
}

extern "C" void simdjson_descriptor_release(LayoutDescriptor* desc) {
  delete desc;
}

extern "C" void* simdjson_parse(Arena* arena,
                                const uint8_t* data,
                                size_t size,
                                bool assume_padded,
                                LayoutDescriptor* desc) {
  const char* input_data;

  if (!assume_padded) {
    auto buf = arena->Allocate(size + SIMDJSON_PADDING);
    memcpy(buf, data, size);
    input_data = reinterpret_cast<const char*>(buf);
  } else {
    input_data = reinterpret_cast<const char*>(data);
  }

  JsonParser p(*arena);
  auto result = p.DoParse(input_data, size, desc);
  if (result == nullptr) {
    return reinterpret_cast<uint8_t*>(p.error()) + 1;
  }
  return result;
}
