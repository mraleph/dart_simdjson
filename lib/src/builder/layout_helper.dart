// Copyright (c) 2024, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:core';
import 'dart:core' as core;

import 'package:dart_simdjson/src/generated/capi.dart'
    show FieldType, kSizesOfFieldTypes, kAvailablePresenceBits;

/// Describes a field which needs to be deserialized from the JSON.
final class Field {
  final bool isOptional;
  final TypeDesc type;

  Field({required this.isOptional, required this.type});
}

/// Type of a field which needs to be deserialized from the JSON.
sealed class TypeDesc {
  /// Underlying native type which will represent deserialized value.
  final FieldType nativeType;

  const TypeDesc(this.nativeType);

  String get typeSuffix => switch (nativeType) {
        FieldType.kString => 'String',
        FieldType.kInt64 => 'Int',
        FieldType.kDouble => 'Double',
        FieldType.kBool => 'Bool',
        FieldType.kCompound => 'Object',
      };

  String get loadMethod => 'load$typeSuffix';

  String get convertMethod => '';

  String get descriptorRef;
}

/// Primitive type (String, bool, int, double).
final class PrimitiveType extends TypeDesc {
  const PrimitiveType._(super.nativeType);

  static const PrimitiveType string = PrimitiveType._(FieldType.kString);
  static const PrimitiveType int = PrimitiveType._(FieldType.kInt64);
  static const PrimitiveType double = PrimitiveType._(FieldType.kDouble);
  static const PrimitiveType bool = PrimitiveType._(FieldType.kBool);

  @override
  String toString() => 'PrimitiveType($nativeType)';

  @override
  core.bool operator ==(Object other) {
    return other is PrimitiveType && other.nativeType == nativeType;
  }

  @override
  core.int get hashCode => nativeType.hashCode;

  @override
  String get descriptorRef => throw 'Primitive types do not have descriptors';
}

/// Object type.
final class ObjectType extends TypeDesc {
  final String className;

  const ObjectType(this.className) : super(FieldType.kCompound);

  @override
  String get descriptorRef => '${className}SimdJson.\$';

  @override
  core.bool operator ==(Object other) {
    return other is ObjectType && other.className == className;
  }

  @override
  core.int get hashCode => className.hashCode;
}

/// Array type.
final class ArrayType extends TypeDesc {
  final TypeDesc elementType;
  final bool isOptional;

  const ArrayType(this.elementType, this.isOptional)
      : super(FieldType.kCompound);

  @override
  String get loadMethod {
    return 'loadList';
  }

  @override
  String get convertMethod {
    final optionality = isOptional ? 'Optional' : '';
    if (elementType is ArrayType) {
      throw 'Lists of lists are currently not supported';
    }
    return 'toListOf$optionality${elementType.typeSuffix}';
  }

  @override
  String get descriptorRef {
    switch (elementType) {
      case PrimitiveType():
        final optionality = isOptional ? 'Optional' : '';
        return 'LayoutDescriptor.\$listOf$optionality${elementType.typeSuffix}';
      case ObjectType(:final className):
        final optionality = isOptional ? 'OfOptional' : '';
        return '${className}SimdJson.\$list$optionality';
      case ArrayType():
        throw 'Nested lists are not supported';
    }
  }

  @override
  core.bool operator ==(Object other) {
    return other is ArrayType &&
        other.isOptional == isOptional &&
        other.elementType == elementType;
  }

  @override
  core.int get hashCode => Object.hash(elementType, isOptional);
}

/// Computes layout of the native object which will be used to store
/// result of JSON decoding on the native side.
final class LayoutHelper {
  final Map<String, Field> fields;

  /// An index of nested compound descriptors this layout depends on.
  final Map<TypeDesc, int> nested;

  /// Native layout (offset and presence bit index if necessary) for each field.
  final Map<String, ({int offset, int? presenceBit})> nativeLayout;

  LayoutHelper(this.fields)
      : nested = _collectNestedDescriptors(fields),
        nativeLayout = _computeNativeLayout(fields);

  static Map<TypeDesc, int> _collectNestedDescriptors(
      Map<String, Field> fields) {
    final nested = <TypeDesc, int>{};
    for (var field in fields.values) {
      if (field.type case ObjectType() || ArrayType()) {
        nested[field.type] ??= nested.length;
      }
    }
    return nested;
  }

  static Map<String, ({int offset, int? presenceBit})> _computeNativeLayout(
      Map<String, Field> fields) {
    final result = <String, ({int offset, int? presenceBit})>{};

    int nextFieldOffset = 0;
    int usedPresenceBits = 0;
    void allocateStorageForField(String fieldName, Field fieldInfo) {
      int? presenceBit;
      if (fieldInfo.isOptional) {
        if (usedPresenceBits == kAvailablePresenceBits) {
          throw ArgumentError(
              'Not enough presence bit available: only $kAvailablePresenceBits supported');
        }
        presenceBit = usedPresenceBits++;
      }
      result[fieldName] = (offset: nextFieldOffset, presenceBit: presenceBit);
      nextFieldOffset += fieldInfo.type.nativeType.nativeSize;
    }

    // First allocate all boolean fields (they take 1 byte).
    for (var MapEntry(key: fieldName, value: fieldInfo) in fields.entries) {
      if (fieldInfo.type.nativeType != FieldType.kBool) {
        continue;
      }
      allocateStorageForField(fieldName, fieldInfo);
    }
    nextFieldOffset = nextFieldOffset.alignTo(powerOfTwo: 8);

    // Now allocate all other fields.
    for (var MapEntry(key: fieldName, value: fieldInfo) in fields.entries) {
      if (result.containsKey(fieldName)) {
        continue;
      }
      allocateStorageForField(fieldName, fieldInfo);
    }

    // Allocate space for presence bits (if any) in chuks of 64 (8 bytes).
    final additionalBytes = usedPresenceBits.alignTo(powerOfTwo: 64) >> 3;
    if (additionalBytes == 0) {
      return result;
    }

    // Reallocate object payload to create space in the header for presence
    // bits.
    return {
      for (final MapEntry(:key, :value) in result.entries)
        key: (
          offset: value.offset + additionalBytes,
          presenceBit: value.presenceBit
        ),
    };
  }
}

extension on FieldType {
  int get nativeSize => (kSizesOfFieldTypes >> (4 * value)) & 0xF;
}

extension on int {
  /// Round this integer value up to the next value divisible by [powerOfTwo].
  int alignTo({required int powerOfTwo}) {
    return (this + powerOfTwo - 1) & ~(powerOfTwo - 1);
  }
}
