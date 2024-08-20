// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lines_longer_than_80_chars, text_direction_code_point_in_literal, inference_failure_on_function_invocation, inference_failure_on_collection_literal, unnecessary_this, non_constant_identifier_names, constant_identifier_names

part of 'for_tests.dart';

// **************************************************************************
// FromJsonBytesGenerator
// **************************************************************************

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension StringFieldSimdJson on StringField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<StringField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kString,
        offset: 0,
        presenceBit: null,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<StringField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<StringField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `StringField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `StringField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<StringField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<StringField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<StringField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<StringField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<StringField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  String get f => this.json.loadString(_offsetOf$f());

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'StringField',
        'f': this.f,
      };
}

extension StringFieldDecoder on Decoder<StringField> {
  /// Decode an [StringField] object from JSON bytes.
  StringField convert(Uint8List bytes) =>
      StringFieldSimdJson.$.decodeBytes(bytes);
}

extension StringFieldListDecoder on Decoder<List<StringField>> {
  /// Decode a list of [StringField] objects from JSON bytes.
  List<StringField> convert(Uint8List bytes) =>
      StringFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension OptionalStringFieldSimdJson on OptionalStringField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<OptionalStringField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kString,
        offset: 8,
        presenceBit: 0,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor =
      LayoutDescriptor<List<OptionalStringField>>.list(FieldType.kCompound,
          elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<OptionalStringField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `OptionalStringField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `OptionalStringField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<OptionalStringField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalStringField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalStringField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalStringField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalStringField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Index of the presence bit denoting whether `f` was present.
  static const int _presenceBit$f = 0;

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 8;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  String? get f => this.json.loadStringOrNull(_offsetOf$f(), _presenceBit$f);

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'OptionalStringField',
        'f': this.f,
      };
}

extension OptionalStringFieldDecoder on Decoder<OptionalStringField> {
  /// Decode an [OptionalStringField] object from JSON bytes.
  OptionalStringField convert(Uint8List bytes) =>
      OptionalStringFieldSimdJson.$.decodeBytes(bytes);
}

extension OptionalStringFieldListDecoder on Decoder<List<OptionalStringField>> {
  /// Decode a list of [OptionalStringField] objects from JSON bytes.
  List<OptionalStringField> convert(Uint8List bytes) =>
      OptionalStringFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension IntFieldSimdJson on IntField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<IntField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kInt64,
        offset: 0,
        presenceBit: null,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<IntField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<IntField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `IntField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `IntField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<IntField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<IntField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<IntField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<IntField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<IntField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  int get f => this.json.loadInt(_offsetOf$f());

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'IntField',
        'f': this.f,
      };
}

extension IntFieldDecoder on Decoder<IntField> {
  /// Decode an [IntField] object from JSON bytes.
  IntField convert(Uint8List bytes) => IntFieldSimdJson.$.decodeBytes(bytes);
}

extension IntFieldListDecoder on Decoder<List<IntField>> {
  /// Decode a list of [IntField] objects from JSON bytes.
  List<IntField> convert(Uint8List bytes) =>
      IntFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension OptionalIntFieldSimdJson on OptionalIntField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<OptionalIntField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kInt64,
        offset: 8,
        presenceBit: 0,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<OptionalIntField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<OptionalIntField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `OptionalIntField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `OptionalIntField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<OptionalIntField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalIntField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalIntField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalIntField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalIntField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Index of the presence bit denoting whether `f` was present.
  static const int _presenceBit$f = 0;

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 8;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  int? get f => this.json.loadIntOrNull(_offsetOf$f(), _presenceBit$f);

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'OptionalIntField',
        'f': this.f,
      };
}

extension OptionalIntFieldDecoder on Decoder<OptionalIntField> {
  /// Decode an [OptionalIntField] object from JSON bytes.
  OptionalIntField convert(Uint8List bytes) =>
      OptionalIntFieldSimdJson.$.decodeBytes(bytes);
}

extension OptionalIntFieldListDecoder on Decoder<List<OptionalIntField>> {
  /// Decode a list of [OptionalIntField] objects from JSON bytes.
  List<OptionalIntField> convert(Uint8List bytes) =>
      OptionalIntFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension BoolFieldSimdJson on BoolField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<BoolField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kBool,
        offset: 0,
        presenceBit: null,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<BoolField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<BoolField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `BoolField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `BoolField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<BoolField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<BoolField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<BoolField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<BoolField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<BoolField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  bool get f => this.json.loadBool(_offsetOf$f());

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'BoolField',
        'f': this.f,
      };
}

extension BoolFieldDecoder on Decoder<BoolField> {
  /// Decode an [BoolField] object from JSON bytes.
  BoolField convert(Uint8List bytes) => BoolFieldSimdJson.$.decodeBytes(bytes);
}

extension BoolFieldListDecoder on Decoder<List<BoolField>> {
  /// Decode a list of [BoolField] objects from JSON bytes.
  List<BoolField> convert(Uint8List bytes) =>
      BoolFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension OptionalBoolFieldSimdJson on OptionalBoolField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<OptionalBoolField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kBool,
        offset: 8,
        presenceBit: 0,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<OptionalBoolField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<OptionalBoolField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `OptionalBoolField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `OptionalBoolField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<OptionalBoolField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalBoolField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalBoolField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalBoolField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalBoolField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Index of the presence bit denoting whether `f` was present.
  static const int _presenceBit$f = 0;

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 8;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  bool? get f => this.json.loadBoolOrNull(_offsetOf$f(), _presenceBit$f);

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'OptionalBoolField',
        'f': this.f,
      };
}

extension OptionalBoolFieldDecoder on Decoder<OptionalBoolField> {
  /// Decode an [OptionalBoolField] object from JSON bytes.
  OptionalBoolField convert(Uint8List bytes) =>
      OptionalBoolFieldSimdJson.$.decodeBytes(bytes);
}

extension OptionalBoolFieldListDecoder on Decoder<List<OptionalBoolField>> {
  /// Decode a list of [OptionalBoolField] objects from JSON bytes.
  List<OptionalBoolField> convert(Uint8List bytes) =>
      OptionalBoolFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension DoubleFieldSimdJson on DoubleField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<DoubleField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kDouble,
        offset: 0,
        presenceBit: null,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<DoubleField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<DoubleField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `DoubleField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `DoubleField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<DoubleField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<DoubleField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<DoubleField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<DoubleField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<DoubleField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  double get f => this.json.loadDouble(_offsetOf$f());

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'DoubleField',
        'f': this.f,
      };
}

extension DoubleFieldDecoder on Decoder<DoubleField> {
  /// Decode an [DoubleField] object from JSON bytes.
  DoubleField convert(Uint8List bytes) =>
      DoubleFieldSimdJson.$.decodeBytes(bytes);
}

extension DoubleFieldListDecoder on Decoder<List<DoubleField>> {
  /// Decode a list of [DoubleField] objects from JSON bytes.
  List<DoubleField> convert(Uint8List bytes) =>
      DoubleFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension OptionalDoubleFieldSimdJson on OptionalDoubleField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<OptionalDoubleField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kDouble,
        offset: 8,
        presenceBit: 0,
        nestedIndex: null
      ),
  ]);
  static final _listDescriptor =
      LayoutDescriptor<List<OptionalDoubleField>>.list(FieldType.kCompound,
          elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<OptionalDoubleField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `OptionalDoubleField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `OptionalDoubleField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<OptionalDoubleField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([]);
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalDoubleField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalDoubleField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalDoubleField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalDoubleField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Index of the presence bit denoting whether `f` was present.
  static const int _presenceBit$f = 0;

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 8;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  double? get f => this.json.loadDoubleOrNull(_offsetOf$f(), _presenceBit$f);

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'OptionalDoubleField',
        'f': this.f,
      };
}

extension OptionalDoubleFieldDecoder on Decoder<OptionalDoubleField> {
  /// Decode an [OptionalDoubleField] object from JSON bytes.
  OptionalDoubleField convert(Uint8List bytes) =>
      OptionalDoubleFieldSimdJson.$.decodeBytes(bytes);
}

extension OptionalDoubleFieldListDecoder on Decoder<List<OptionalDoubleField>> {
  /// Decode a list of [OptionalDoubleField] objects from JSON bytes.
  List<OptionalDoubleField> convert(Uint8List bytes) =>
      OptionalDoubleFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ObjectFieldSimdJson on ObjectField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<ObjectField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<ObjectField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ObjectField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `ObjectField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ObjectField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ObjectField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([StringFieldSimdJson.$]);
  }

  /// [LayoutDescriptor] corresponding to `List<ObjectField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ObjectField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ObjectField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ObjectField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  StringField get f => this.json.loadObject(_offsetOf$f());

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ObjectField',
        'f': this.f.toMap(includeType: includeType),
      };
}

extension ObjectFieldDecoder on Decoder<ObjectField> {
  /// Decode an [ObjectField] object from JSON bytes.
  ObjectField convert(Uint8List bytes) =>
      ObjectFieldSimdJson.$.decodeBytes(bytes);
}

extension ObjectFieldListDecoder on Decoder<List<ObjectField>> {
  /// Decode a list of [ObjectField] objects from JSON bytes.
  List<ObjectField> convert(Uint8List bytes) =>
      ObjectFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension OptionalObjectFieldSimdJson on OptionalObjectField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<OptionalObjectField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 8,
        presenceBit: 0,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor =
      LayoutDescriptor<List<OptionalObjectField>>.list(FieldType.kCompound,
          elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<OptionalObjectField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `OptionalObjectField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `OptionalObjectField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<OptionalObjectField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([StringFieldSimdJson.$]);
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalObjectField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalObjectField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<OptionalObjectField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<OptionalObjectField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Index of the presence bit denoting whether `f` was present.
  static const int _presenceBit$f = 0;

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 8;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  StringField? get f =>
      this.json.loadObjectOrNull(_offsetOf$f(), _presenceBit$f);

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'OptionalObjectField',
        'f': this.f?.toMap(includeType: includeType),
      };
}

extension OptionalObjectFieldDecoder on Decoder<OptionalObjectField> {
  /// Decode an [OptionalObjectField] object from JSON bytes.
  OptionalObjectField convert(Uint8List bytes) =>
      OptionalObjectFieldSimdJson.$.decodeBytes(bytes);
}

extension OptionalObjectFieldListDecoder on Decoder<List<OptionalObjectField>> {
  /// Decode a list of [OptionalObjectField] objects from JSON bytes.
  List<OptionalObjectField> convert(Uint8List bytes) =>
      OptionalObjectFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfObjectFieldSimdJson on ListOfObjectField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<ListOfObjectField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<ListOfObjectField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfObjectField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfObjectField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfObjectField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfObjectField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([StringFieldSimdJson.$list]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfObjectField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfObjectField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfObjectField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfObjectField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<StringField> get f => this.json.loadList(_offsetOf$f()).toListOfObject();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfObjectField',
        'f': this.f.map((v) => v.toMap(includeType: includeType)).toList(),
      };
}

extension ListOfObjectFieldDecoder on Decoder<ListOfObjectField> {
  /// Decode an [ListOfObjectField] object from JSON bytes.
  ListOfObjectField convert(Uint8List bytes) =>
      ListOfObjectFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfObjectFieldListDecoder on Decoder<List<ListOfObjectField>> {
  /// Decode a list of [ListOfObjectField] objects from JSON bytes.
  List<ListOfObjectField> convert(Uint8List bytes) =>
      ListOfObjectFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfIntFieldSimdJson on ListOfIntField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<ListOfIntField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<ListOfIntField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfIntField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfIntField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfIntField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfIntField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([LayoutDescriptor.$listOfInt]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfIntField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfIntField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfIntField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfIntField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<int> get f => this.json.loadList(_offsetOf$f()).toListOfInt();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfIntField',
        'f': this.f,
      };
}

extension ListOfIntFieldDecoder on Decoder<ListOfIntField> {
  /// Decode an [ListOfIntField] object from JSON bytes.
  ListOfIntField convert(Uint8List bytes) =>
      ListOfIntFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfIntFieldListDecoder on Decoder<List<ListOfIntField>> {
  /// Decode a list of [ListOfIntField] objects from JSON bytes.
  List<ListOfIntField> convert(Uint8List bytes) =>
      ListOfIntFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfDoubleFieldSimdJson on ListOfDoubleField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<ListOfDoubleField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<ListOfDoubleField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfDoubleField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfDoubleField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfDoubleField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfDoubleField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([LayoutDescriptor.$listOfDouble]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfDoubleField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfDoubleField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfDoubleField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfDoubleField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<double> get f => this.json.loadList(_offsetOf$f()).toListOfDouble();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfDoubleField',
        'f': this.f,
      };
}

extension ListOfDoubleFieldDecoder on Decoder<ListOfDoubleField> {
  /// Decode an [ListOfDoubleField] object from JSON bytes.
  ListOfDoubleField convert(Uint8List bytes) =>
      ListOfDoubleFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfDoubleFieldListDecoder on Decoder<List<ListOfDoubleField>> {
  /// Decode a list of [ListOfDoubleField] objects from JSON bytes.
  List<ListOfDoubleField> convert(Uint8List bytes) =>
      ListOfDoubleFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfStringFieldSimdJson on ListOfStringField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<ListOfStringField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<ListOfStringField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfStringField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfStringField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfStringField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfStringField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([LayoutDescriptor.$listOfString]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfStringField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfStringField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfStringField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfStringField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<String> get f => this.json.loadList(_offsetOf$f()).toListOfString();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfStringField',
        'f': this.f,
      };
}

extension ListOfStringFieldDecoder on Decoder<ListOfStringField> {
  /// Decode an [ListOfStringField] object from JSON bytes.
  ListOfStringField convert(Uint8List bytes) =>
      ListOfStringFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfStringFieldListDecoder on Decoder<List<ListOfStringField>> {
  /// Decode a list of [ListOfStringField] objects from JSON bytes.
  List<ListOfStringField> convert(Uint8List bytes) =>
      ListOfStringFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfBoolFieldSimdJson on ListOfBoolField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<ListOfBoolField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor = LayoutDescriptor<List<ListOfBoolField>>.list(
      FieldType.kCompound,
      elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfBoolField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfBoolField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfBoolField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfBoolField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([LayoutDescriptor.$listOfBool]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfBoolField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfBoolField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfBoolField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfBoolField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<bool> get f => this.json.loadList(_offsetOf$f()).toListOfBool();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfBoolField',
        'f': this.f,
      };
}

extension ListOfBoolFieldDecoder on Decoder<ListOfBoolField> {
  /// Decode an [ListOfBoolField] object from JSON bytes.
  ListOfBoolField convert(Uint8List bytes) =>
      ListOfBoolFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfBoolFieldListDecoder on Decoder<List<ListOfBoolField>> {
  /// Decode a list of [ListOfBoolField] objects from JSON bytes.
  List<ListOfBoolField> convert(Uint8List bytes) =>
      ListOfBoolFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfOptionalObjectFieldSimdJson on ListOfOptionalObjectField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor =
      LayoutDescriptor<ListOfOptionalObjectField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor =
      LayoutDescriptor<List<ListOfOptionalObjectField>>.list(
          FieldType.kCompound,
          elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfOptionalObjectField?>>.list(
          FieldType.kCompound,
          elementLayout: _descriptor,
          isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfOptionalObjectField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfOptionalObjectField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfOptionalObjectField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([StringFieldSimdJson.$listOfOptional]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalObjectField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalObjectField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalObjectField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalObjectField?>>
      get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<StringField?> get f =>
      this.json.loadList(_offsetOf$f()).toListOfOptionalObject();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfOptionalObjectField',
        'f': this.f.map((v) => v?.toMap(includeType: includeType)).toList(),
      };
}

extension ListOfOptionalObjectFieldDecoder
    on Decoder<ListOfOptionalObjectField> {
  /// Decode an [ListOfOptionalObjectField] object from JSON bytes.
  ListOfOptionalObjectField convert(Uint8List bytes) =>
      ListOfOptionalObjectFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfOptionalObjectFieldListDecoder
    on Decoder<List<ListOfOptionalObjectField>> {
  /// Decode a list of [ListOfOptionalObjectField] objects from JSON bytes.
  List<ListOfOptionalObjectField> convert(Uint8List bytes) =>
      ListOfOptionalObjectFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfOptionalIntFieldSimdJson on ListOfOptionalIntField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<ListOfOptionalIntField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor =
      LayoutDescriptor<List<ListOfOptionalIntField>>.list(FieldType.kCompound,
          elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfOptionalIntField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfOptionalIntField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfOptionalIntField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfOptionalIntField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([LayoutDescriptor.$listOfOptionalInt]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalIntField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalIntField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalIntField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalIntField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<int?> get f => this.json.loadList(_offsetOf$f()).toListOfOptionalInt();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfOptionalIntField',
        'f': this.f,
      };
}

extension ListOfOptionalIntFieldDecoder on Decoder<ListOfOptionalIntField> {
  /// Decode an [ListOfOptionalIntField] object from JSON bytes.
  ListOfOptionalIntField convert(Uint8List bytes) =>
      ListOfOptionalIntFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfOptionalIntFieldListDecoder
    on Decoder<List<ListOfOptionalIntField>> {
  /// Decode a list of [ListOfOptionalIntField] objects from JSON bytes.
  List<ListOfOptionalIntField> convert(Uint8List bytes) =>
      ListOfOptionalIntFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfOptionalDoubleFieldSimdJson on ListOfOptionalDoubleField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor =
      LayoutDescriptor<ListOfOptionalDoubleField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor =
      LayoutDescriptor<List<ListOfOptionalDoubleField>>.list(
          FieldType.kCompound,
          elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfOptionalDoubleField?>>.list(
          FieldType.kCompound,
          elementLayout: _descriptor,
          isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfOptionalDoubleField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfOptionalDoubleField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfOptionalDoubleField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([LayoutDescriptor.$listOfOptionalDouble]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalDoubleField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalDoubleField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalDoubleField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalDoubleField?>>
      get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<double?> get f =>
      this.json.loadList(_offsetOf$f()).toListOfOptionalDouble();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfOptionalDoubleField',
        'f': this.f,
      };
}

extension ListOfOptionalDoubleFieldDecoder
    on Decoder<ListOfOptionalDoubleField> {
  /// Decode an [ListOfOptionalDoubleField] object from JSON bytes.
  ListOfOptionalDoubleField convert(Uint8List bytes) =>
      ListOfOptionalDoubleFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfOptionalDoubleFieldListDecoder
    on Decoder<List<ListOfOptionalDoubleField>> {
  /// Decode a list of [ListOfOptionalDoubleField] objects from JSON bytes.
  List<ListOfOptionalDoubleField> convert(Uint8List bytes) =>
      ListOfOptionalDoubleFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfOptionalStringFieldSimdJson on ListOfOptionalStringField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor =
      LayoutDescriptor<ListOfOptionalStringField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor =
      LayoutDescriptor<List<ListOfOptionalStringField>>.list(
          FieldType.kCompound,
          elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfOptionalStringField?>>.list(
          FieldType.kCompound,
          elementLayout: _descriptor,
          isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfOptionalStringField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfOptionalStringField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfOptionalStringField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([LayoutDescriptor.$listOfOptionalString]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalStringField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalStringField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalStringField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalStringField?>>
      get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<String?> get f =>
      this.json.loadList(_offsetOf$f()).toListOfOptionalString();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfOptionalStringField',
        'f': this.f,
      };
}

extension ListOfOptionalStringFieldDecoder
    on Decoder<ListOfOptionalStringField> {
  /// Decode an [ListOfOptionalStringField] object from JSON bytes.
  ListOfOptionalStringField convert(Uint8List bytes) =>
      ListOfOptionalStringFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfOptionalStringFieldListDecoder
    on Decoder<List<ListOfOptionalStringField>> {
  /// Decode a list of [ListOfOptionalStringField] objects from JSON bytes.
  List<ListOfOptionalStringField> convert(Uint8List bytes) =>
      ListOfOptionalStringFieldSimdJson.$list.decodeBytes(bytes);
}

/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ListOfOptionalBoolFieldSimdJson on ListOfOptionalBoolField {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor =
      LayoutDescriptor<ListOfOptionalBoolField>.unlinked([
    if (_weakRef(_offsetOf$f) != null)
      (
        name: 'f',
        type: FieldType.kCompound,
        offset: 0,
        presenceBit: null,
        nestedIndex: 0
      ),
  ]);
  static final _listDescriptor =
      LayoutDescriptor<List<ListOfOptionalBoolField>>.list(FieldType.kCompound,
          elementLayout: _descriptor);
  static final _listOfOptionalDescriptor =
      LayoutDescriptor<List<ListOfOptionalBoolField?>>.list(FieldType.kCompound,
          elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `ListOfOptionalBoolField` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `ListOfOptionalBoolField` data.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<ListOfOptionalBoolField> get $ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([LayoutDescriptor.$listOfOptionalBool]);
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalBoolField>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalBoolField>> get $list {
    $; // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<ListOfOptionalBoolField?>` type.
  @pragma('vm:prefer-inline')
  static LayoutDescriptor<List<ListOfOptionalBoolField?>> get $listOfOptional {
    $; // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  /// Offset to the field `f` within `NativeJsonObject`.
  @pragma('vm:prefer-inline')
  static int _offsetOf$f() => 0;

  /// Accessor for `f` field.
  @pragma('vm:prefer-inline')
  List<bool?> get f => this.json.loadList(_offsetOf$f()).toListOfOptionalBool();

  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
        if (includeType) r'$type': 'ListOfOptionalBoolField',
        'f': this.f,
      };
}

extension ListOfOptionalBoolFieldDecoder on Decoder<ListOfOptionalBoolField> {
  /// Decode an [ListOfOptionalBoolField] object from JSON bytes.
  ListOfOptionalBoolField convert(Uint8List bytes) =>
      ListOfOptionalBoolFieldSimdJson.$.decodeBytes(bytes);
}

extension ListOfOptionalBoolFieldListDecoder
    on Decoder<List<ListOfOptionalBoolField>> {
  /// Decode a list of [ListOfOptionalBoolField] objects from JSON bytes.
  List<ListOfOptionalBoolField> convert(Uint8List bytes) =>
      ListOfOptionalBoolFieldSimdJson.$list.decodeBytes(bytes);
}
