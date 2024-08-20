// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#ifndef DART_SIMDJSON_IMPL_H
#define DART_SIMDJSON_IMPL_H

#include <stdint.h>
#include <stdlib.h>

#ifdef __cplusplus
struct Arena;
class LayoutDescriptor;

// In C++ we can specify storage type for the enumeration, but
// this does not have an equivalent in C (and we have to keep
// this header parsable as a C code for `ffigen`). Thus we
// introduce a macros to hide this.
#define DECLARE_ENUM(Name, StorageType) enum class Name : StorageType

extern "C" {
#else
typedef _Bool bool;
typedef struct Arena Arena;
typedef struct LayoutDescriptor LayoutDescriptor;

#define DECLARE_ENUM(Name, StorageType) \
  typedef StorageType Name;             \
  enum Name

#endif

// Creates an arena to use for allocation during parsing.
//
// Objects created by `simdjson_parse` remain valid only as long as
// arena is alive. Once arena is released all memory it owns is freed.
Arena* simdjson_arena_create();

// Release the arena.
void simdjson_arena_release(Arena* arena);

// Designates expected type of a field in JSON object.
DECLARE_ENUM(FieldType, uint8_t){
    // Nested compound (e.g. an object or an array).
    kCompound, kString, kInt64, kDouble, kBool,
};

enum {
  // Size of the storage required for the corresponding `FieldType`.
  //
  // Each nibble corresponds to the specific `FieldType` in order (from least
  // significant to most significant).
  //
  // Encoded in this way because `ffigen` can export this constant but
  // does not export strings.
  kSizesOfFieldTypes = 0x18888,
};

typedef uint8_t PresenceBitIndex;

enum {
  // Max number of presence bits which can be encoded in `PresenseBitIndex`
  // type.
  //
  // We use 0 to signify required fields, which means we have one less
  // presence bit.
  kAvailablePresenceBits = (1 << 8) * sizeof(PresenceBitIndex) - 1,

  // Number of elements in the array chunk.
  //
  // See `ArrayBuilder` and `ArrayChunk` implementation classes.
  kArrayChunkSize = 64,
};

// Describes field to extract from JSON.
//
// Must match `lib/src/capi.dart`
struct FieldDescriptor {
  // Destination offset at which extracted value will be stored.
  uint16_t offset;

  // Index of the presence bit plus one or zero for required fields.
  //
  // If the field was absent in JSON (or was equal to null) corresponding
  // presence bit will be `0`, otherwise it will be `1`.
  PresenceBitIndex presence_bit;

  // Expected type of the field (see `FieldType`).
  FieldType type;

  // For compound fields this is an index of the corresponding nested layout
  // descriptor which should be used for parsing the field value.
  uint8_t descriptor_index;
};

// Create layout descriptor for an object with `num_fields` fields.
//
// `data` has the following format: first `FieldDescriptor` for each field
// then a nul-terminated string containing a name for each field separated with
// commas.
LayoutDescriptor* simdjson_descriptor_create_object(const uint8_t* data,
                                                    uint32_t num_fields);

// Create layout descriptor for an array.
LayoutDescriptor* simdjson_descriptor_create_array(
    FieldType element_type,
    bool is_optional,
    LayoutDescriptor* element_layout);

// Link the given descriptor to descriptors it depends on for decoding
// nested objects.
//
// `desc` will take ownership of the memory allocated for `nested`.
void simdjson_descriptor_link(LayoutDescriptor* desc,
                              LayoutDescriptor** nested);

// Delete the given descriptor.
void simdjson_descriptor_release(LayoutDescriptor* desc);

// Parse `size` bytes from `data` using supplied layout descriptor `desc`.
//
// All dynamically allocated objects will reside in the given `arena`.
//
// If `assume_padded` is `true` then `data` we will assume that at least
// `SIMDJSON_PADDING` bytes is readable after `data + size` (the actual
// content does not matter). If it is not a safe assumption then
// `assume_padded` should be `false` and the function will copy `data` into
// large enough buffer.
//
// If this function succeeds it returns a 8 byte aligned pointer containing
// the data as described by `desc` layout descriptor.
//
// If an error occurs then this function returns an 8 byte aligned error
// message string with least significant bit set to 1 to mark it.
//
// In both cases underlying memory is owned by `arena` and is only valid
// as long as `arena` is not released.
void* simdjson_parse(Arena* arena,
                     const uint8_t* data,
                     size_t size,
                     bool assume_padded,
                     LayoutDescriptor* desc);

#undef DECLARE_ENUM

#ifdef __cplusplus
}  // extern "C";
#endif

#endif