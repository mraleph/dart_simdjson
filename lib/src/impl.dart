// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'package:dart_simdjson/src/generated/capi.dart' as capi;

part 'array_helpers.dart';

/// Expose underlying [capi.FieldType].
typedef FieldType = capi.FieldType;

/// List of fields with information about their location in the native object.
///
/// Actual offset are usually computed by [LayoutHelper] and embedded into
/// source by [FromJsonBytesGenerator].
typedef RawLayoutDescriptor = List<
    ({
      String name,
      FieldType type,
      int offset,
      int? presenceBit,
      int? nestedIndex
    })>;

/// Wrapper around [capi.LayoutDescriptor].
///
/// Describes layout of an native object for `capi.simdjson_parse`: which
/// fields extract from JSON, how and where to store them.
final class LayoutDescriptor<T> implements Finalizable {
  final RawLayoutDescriptor original;
  final Pointer<capi.LayoutDescriptor> _impl;

  static final _finalizer = NativeFinalizer(Native.addressOf<
              NativeFunction<Void Function(Pointer<capi.LayoutDescriptor>)>>(
          capi.simdjson_descriptor_release)
      .cast());

  LayoutDescriptor._(this.original, this._impl) {
    _finalizer.attach(this, _impl.cast());
  }

  /// Creates and unlinked [LayoutDescriptor] from [RawLayoutDescriptor].
  ///
  /// Unlinked descriptors don't have their nested descriptors set yet and
  /// thus can't be used for parsing (if they need any). Linking is done
  /// later by [LayoutDescriptor.link].
  ///
  /// Two-phase initialization allows to handle recursive descriptors.
  factory LayoutDescriptor.unlinked(RawLayoutDescriptor fields) {
    // Compute total length of field names (including NUL-terminator).
    //
    // We assume all names are ascii.
    final sizeOfNames = fields.fold(0, (v, f) => v + f.name.length + 1);

    // Allocate space: we will need a [capi.FieldDescriptor] for each field
    // plus space for all names.
    final encoded = Uint8List(
        sizeOfNames + sizeOf<capi.FieldDescriptor>() * fields.length + 1);

    var namePos = sizeOf<capi.FieldDescriptor>() * fields.length;
    for (var i = 0; i < fields.length; i++) {
      final field = fields[i];

      // Encode the name.
      // We assume name only contains ascii characters.
      final fieldName = field.name;
      for (var j = 0; j < fieldName.length; j++) {
        encoded[namePos++] = fieldName.codeUnitAt(j);
      }
      encoded[namePos++] = ','.codeUnitAt(0);

      // Encode the descriptor.
      Struct.create<capi.FieldDescriptor>(
          encoded, i * sizeOf<capi.FieldDescriptor>())
        ..offset = field.offset
        ..type = field.type.value
        ..descriptor_index = field.nestedIndex ?? 0
        ..presence_bit = (field.presenceBit ?? -1) + 1;
    }
    if (namePos > 0) {
      // Replace last comma with NUL terminator.
      encoded[namePos - 1] = 0;
    }

    // Create descriptor.
    return LayoutDescriptor._(fields,
        capi.simdjson_descriptor_create_object(encoded.address, fields.length));
  }

  /// Create a descriptor for an array.
  factory LayoutDescriptor.list(
    FieldType elementType, {
    bool isNullable = false,
    LayoutDescriptor? elementLayout,
  }) {
    return LayoutDescriptor._(
      [],
      capi.simdjson_descriptor_create_array(
        elementType.value,
        isNullable,
        elementLayout != null ? elementLayout._impl : nullptr,
      ),
    );
  }

  void link(List<LayoutDescriptor> nested) {
    final cNested = calloc.allocate<Pointer<capi.LayoutDescriptor>>(
        sizeOf<Pointer<capi.LayoutDescriptor>>() * nested.length);
    for (int i = 0; i < nested.length; i++) {
      cNested[i] = nested[i]._impl;
    }
    capi.simdjson_descriptor_link(_impl, cNested);
  }

  Pointer<Uint8> _parseBytes(_Arena arena, Uint8List bytes) {
    final result = capi.simdjson_parse(
        arena._impl, bytes.address, bytes.length, true, _impl);

    // Check if parser returned an error.
    if ((result.address & 1) != 0) {
      throw Pointer<Utf8>.fromAddress(result.address - 1).toDartString();
    }

    // Parsing succeeded.
    return result.cast();
  }

  @override
  String toString() {
    return 'layout { $original, $_impl }';
  }

  static final $listOfInt = LayoutDescriptor<List<int>>.list(FieldType.kInt64);
  static final $listOfOptionalInt =
      LayoutDescriptor<List<int?>>.list(FieldType.kInt64, isNullable: true);
  static final $listOfString =
      LayoutDescriptor<List<String>>.list(FieldType.kString);
  static final $listOfOptionalString =
      LayoutDescriptor<List<String?>>.list(FieldType.kString, isNullable: true);
  static final $listOfDouble =
      LayoutDescriptor<List<double>>.list(FieldType.kDouble);
  static final $listOfOptionalDouble =
      LayoutDescriptor<List<double?>>.list(FieldType.kDouble, isNullable: true);
  static final $listOfBool = LayoutDescriptor<List<bool>>.list(FieldType.kBool);
  static final $listOfOptionalBool =
      LayoutDescriptor<List<bool?>>.list(FieldType.kBool, isNullable: true);
}

extension DecodeBytes<T> on LayoutDescriptor<T> {
  T decodeBytes(Uint8List bytes) {
    final arena = _Arena();
    final data = _parseBytes(arena, bytes);
    if (data == nullptr) {
      throw 'Failed to parse!';
    }
    return NativeJsonObject._(arena, data) as T;
  }
}

extension DecodeBytesToList<T> on LayoutDescriptor<List<T>> {
  List<T> decodeBytes(Uint8List bytes) {
    final arena = _Arena();
    final data = _parseBytes(arena, bytes);
    if (data == nullptr) {
      throw 'Failed to parse';
    }

    return NativeJsonObject._(arena, data).toListOfObject();
  }
}

/// Wrapper around [capi.Arena] used for allocation during parsing.
///
/// All [NativeJsonObject] are associated with an [_Arena] and are only
/// valid as long as their arena is alive. Thus we store corresponding
/// [_Arena] in the [NativeJsonObject._arena]: once the last [NativeJsonObject]
/// referencing that arena becomes unreachable [_Arena] becomes eligible
/// for reclamation by garbage collection.
final class _Arena implements Finalizable {
  final Pointer<capi.Arena> _impl;

  _Arena._(this._impl);

  static final _finalizer = NativeFinalizer(
      Native.addressOf<NativeFunction<Void Function(Pointer<capi.Arena>)>>(
              capi.simdjson_arena_release)
          .cast());

  factory _Arena() {
    final result = _Arena._(capi.simdjson_arena_create());
    _finalizer.attach(result, result._impl.cast());
    return result;
  }
}

/// A blob of native memory filled with information from JSON bytes according
/// to a [LayoutDescriptor].
final class NativeJsonObject {
  /// Arena which owns the memory occupied by this object.
  final _Arena _arena;

  /// Pointer to the memory occupied by this object.
  final Pointer<Uint8> _data;

  NativeJsonObject._(this._arena, this._data);
}

extension RawFieldAccessors on NativeJsonObject {
  @pragma('vm:prefer-inline')
  int loadByte(int offset) {
    return Pointer<Uint8>.fromAddress(_data.address + offset).value;
  }

  @pragma('vm:prefer-inline')
  int loadInt(int offset) {
    return Pointer<Int64>.fromAddress(_data.address + offset).value;
  }

  @pragma('vm:prefer-inline')
  int? loadIntOrNull(int offset, int presenceBit) {
    return _isPresent(presenceBit) ? loadInt(offset) : null;
  }

  @pragma('vm:prefer-inline')
  double loadDouble(int offset) {
    return Pointer<Double>.fromAddress(_data.address + offset).value;
  }

  @pragma('vm:prefer-inline')
  double? loadDoubleOrNull(int offset, int presenceBit) {
    return _isPresent(presenceBit) ? loadDouble(offset) : null;
  }

  @pragma('vm:prefer-inline')
  String loadString(int offset) {
    final startAddr = loadInt(offset);
    return Pointer<Utf8>.fromAddress(startAddr).toDartString();
  }

  @pragma('vm:prefer-inline')
  String? loadStringOrNull(int offset, int presenceBit) {
    return _isPresent(presenceBit) ? loadString(offset) : null;
  }

  @pragma('vm:prefer-inline')
  T loadObject<T>(int offset) {
    return NativeJsonObject._(
        _arena, Pointer<Uint8>.fromAddress(loadInt(offset))) as T;
  }

  @pragma('vm:prefer-inline')
  T? loadObjectOrNull<T>(int offset, int presenceBit) {
    return _isPresent(presenceBit) ? loadObject(offset) : null;
  }

  @pragma('vm:prefer-inline')
  bool loadBool(int offset) {
    return loadByte(offset) != 0;
  }

  @pragma('vm:prefer-inline')
  bool? loadBoolOrNull(int offset, int presenceBit) {
    return _isPresent(presenceBit) ? loadBool(offset) : null;
  }

  @pragma('vm:prefer-inline')
  NativeJsonObject loadList(int offset) {
    final result = loadObject(offset);
    return result;
  }

  @pragma('vm:prefer-inline')
  NativeJsonObject loadListOrNull(int offset, int presenceBit) {
    return loadObjectOrNull(offset, presenceBit);
  }

  @pragma('vm:prefer-inline')
  bool _isPresent(int bit) {
    final cellOffset = (bit >> 3) & ~7;
    final bitIndex = bit & 63;
    return (loadInt(cellOffset) & (1 << bitIndex)) != 0;
  }
}
