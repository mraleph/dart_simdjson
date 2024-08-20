// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

/// Creates an arena to use for allocation during parsing.
///
/// Objects created by `simdjson_parse` remain valid only as long as
/// arena is alive. Once arena is released all memory it owns is freed.
@ffi.Native<ffi.Pointer<Arena> Function()>()
external ffi.Pointer<Arena> simdjson_arena_create();

/// Release the arena.
@ffi.Native<ffi.Void Function(ffi.Pointer<Arena>)>()
external void simdjson_arena_release(
  ffi.Pointer<Arena> arena,
);

/// Create layout descriptor for an object with `num_fields` fields.
///
/// `data` has the following format: first `FieldDescriptor` for each field
/// then a nul-terminated string containing a name for each field separated with
/// commas.
@ffi.Native<
    ffi.Pointer<LayoutDescriptor> Function(
        ffi.Pointer<ffi.Uint8>, ffi.Uint32)>(isLeaf: true)
external ffi.Pointer<LayoutDescriptor> simdjson_descriptor_create_object(
  ffi.Pointer<ffi.Uint8> data,
  int num_fields,
);

/// Create layout descriptor for an array.
@ffi.Native<
    ffi.Pointer<LayoutDescriptor> Function(
        FieldType1, ffi.Bool, ffi.Pointer<LayoutDescriptor>)>()
external ffi.Pointer<LayoutDescriptor> simdjson_descriptor_create_array(
  int element_type,
  bool is_optional,
  ffi.Pointer<LayoutDescriptor> element_layout,
);

/// Link the given descriptor to descriptors it depends on for decoding
/// nested objects.
///
/// `desc` will take ownership of the memory allocated for `nested`.
@ffi.Native<
    ffi.Void Function(ffi.Pointer<LayoutDescriptor>,
        ffi.Pointer<ffi.Pointer<LayoutDescriptor>>)>()
external void simdjson_descriptor_link(
  ffi.Pointer<LayoutDescriptor> desc,
  ffi.Pointer<ffi.Pointer<LayoutDescriptor>> nested,
);

/// Delete the given descriptor.
@ffi.Native<ffi.Void Function(ffi.Pointer<LayoutDescriptor>)>()
external void simdjson_descriptor_release(
  ffi.Pointer<LayoutDescriptor> desc,
);

/// Parse `size` bytes from `data` using supplied layout descriptor `desc`.
///
/// All dynamically allocated objects will reside in the given `arena`.
///
/// If `assume_padded` is `true` then `data` we will assume that at least
/// `SIMDJSON_PADDING` bytes is readable after `data + size` (the actual
/// content does not matter). If it is not a safe assumption then
/// `assume_padded` should be `false` and the function will copy `data` into
/// large enough buffer.
///
/// If this function succeeds it returns a 8 byte aligned pointer containing
/// the data as described by `desc` layout descriptor.
///
/// If an error occurs then this function returns an 8 byte aligned error
/// message string with least significant bit set to 1 to mark it.
///
/// In both cases underlying memory is owned by `arena` and is only valid
/// as long as `arena` is not released.
@ffi.Native<
    ffi.Pointer<ffi.Void> Function(ffi.Pointer<Arena>, ffi.Pointer<ffi.Uint8>,
        ffi.Size, ffi.Bool, ffi.Pointer<LayoutDescriptor>)>(isLeaf: true)
external ffi.Pointer<ffi.Void> simdjson_parse(
  ffi.Pointer<Arena> arena,
  ffi.Pointer<ffi.Uint8> data,
  int size,
  bool assume_padded,
  ffi.Pointer<LayoutDescriptor> desc,
);

final class Arena extends ffi.Opaque {}

final class LayoutDescriptor extends ffi.Opaque {}

/// Designates expected type of a field in JSON object.
enum FieldType {
  /// Nested compound (e.g. an object or an array).
  kCompound(0),
  kString(1),
  kInt64(2),
  kDouble(3),
  kBool(4);

  final int value;
  const FieldType(this.value);

  static FieldType fromValue(int value) => switch (value) {
        0 => kCompound,
        1 => kString,
        2 => kInt64,
        3 => kDouble,
        4 => kBool,
        _ => throw ArgumentError("Unknown value for FieldType: $value"),
      };
}

/// Describes field to extract from JSON.
///
/// Must match `lib/src/capi.dart`
final class FieldDescriptor extends ffi.Struct {
  /// Destination offset at which extracted value will be stored.
  @ffi.Uint16()
  external int offset;

  /// Index of the presence bit plus one or zero for required fields.
  ///
  /// If the field was absent in JSON (or was equal to null) corresponding
  /// presence bit will be `0`, otherwise it will be `1`.
  @PresenceBitIndex()
  external int presence_bit;

  /// Expected type of the field (see `FieldType`).
  @FieldType1()
  external int type;

  /// For compound fields this is an index of the corresponding nested layout
  /// descriptor which should be used for parsing the field value.
  @ffi.Uint8()
  external int descriptor_index;
}

typedef PresenceBitIndex = ffi.Uint8;
typedef DartPresenceBitIndex = int;
typedef FieldType1 = ffi.Uint8;
typedef DartFieldType = int;

const int kSizesOfFieldTypes = 100488;

const int kAvailablePresenceBits = 255;

const int kArrayChunkSize = 64;
