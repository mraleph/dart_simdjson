// Copyright (c) 2024, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:dart_simdjson/src/annotation.dart';
import 'package:dart_simdjson/src/builder/layout_helper.dart';

/// This code generator generates auxiliary code for decoding JSON from
/// bytes into structured data.
///
/// Native layout is computed by [LayoutHelper] class.
///
/// See documentation on [FromJsonBytes] for more information.
class FromJsonBytesGenerator extends GeneratorForAnnotation<FromJsonBytes> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ExtensionTypeElement) {
      throw InvalidGenerationSourceError(
        '`@FromJsonBytes` should only be applied to extension types.',
        element: element,
      );
    }
    final jsonRef = 'this.${element.representation.name}';

    // Start by computing offset and presence bit index for each field.
    final (layout, dartTypes) = _computeLayoutFromRepresentationType(element);

    // Generate code based on computed layout.
    final descriptor = _generateDescriptor(layout);
    final accessors = _generateAccessors(layout, dartTypes, jsonRef);
    final nestedDescriptors =
        [for (var desc in layout.nested.keys) desc.descriptorRef].join(',');
    final toMapMethod = _generateToMap(element.name, layout);

    // Glue it all together into several extensions.
    return '''
/// Helper methods for accessing data deserilized from JSON and stored
/// on the native side.
extension ${element.name}SimdJson on ${element.name} {
  /// Auxiliary function to enable tree-shaking of unused parts of the
  /// descriptor. See README.md for details.
  @pragma('weak-tearoff-reference')
  static T Function()? _weakRef<T>(T Function()? x) => x;

  static bool _descriptorWasLinked = false;
  static final _descriptor = LayoutDescriptor<${element.name}>.unlinked($descriptor);
  static final _listDescriptor = LayoutDescriptor<List<${element.name}>>.list(FieldType.kCompound, elementLayout: _descriptor);
  static final _listOfOptionalDescriptor = LayoutDescriptor<List<${element.name}?>>.list(FieldType.kCompound, elementLayout: _descriptor, isNullable: true);

  /// [LayoutDescriptor] corresponding to `${element.name}` type.
  ///
  /// It can be used to deserialize JSON bytes into a native object representing
  /// `${element.name}` data.
  $_preferInline
  static LayoutDescriptor<${element.name}> get \$ {
    if (_descriptorWasLinked) {
      return _descriptor;
    }
    _descriptorWasLinked = true;
    return _descriptor..link([$nestedDescriptors]);
  }

  /// [LayoutDescriptor] corresponding to `List<${element.name}>` type.
  $_preferInline
  static LayoutDescriptor<List<${element.name}>> get \$list {
    \$;  // Make sure to link norma descriptor.
    return _listDescriptor;
  }

  /// [LayoutDescriptor] corresponding to `List<${element.name}?>` type.
  $_preferInline
  static LayoutDescriptor<List<${element.name}?>> get \$listOfOptional {
    \$;  // Make sure to link norma descriptor.
    return _listOfOptionalDescriptor;
  }

  $accessors

  $toMapMethod
}

extension ${element.name}Decoder on Decoder<${element.name}> {
  /// Decode an [${element.name}] object from JSON bytes.
  ${element.name} convert(Uint8List bytes) => ${element.name}SimdJson.\$.decodeBytes(bytes);
}

extension ${element.name}ListDecoder on Decoder<List<${element.name}>> {
  /// Decode a list of [${element.name}] objects from JSON bytes.
  List<${element.name}> convert(Uint8List bytes) => ${element.name}SimdJson.\$list.decodeBytes(bytes);
}
''';
  }

  /// Generates a simple `toMap` method which converts deseralized object
  /// into a `Map`.
  String _generateToMap(String className, LayoutHelper layout) {
    final toMapMethod = StringBuffer();
    toMapMethod.writeln('''
  /// Converts deserialized object into a [Map].
  ///
  /// Note: calling this would disable tree-shaking of fields.
  Map<String, dynamic> toMap({bool includeType = false}) => {
    if (includeType) r'\$type': '$className',
    ''');
    for (var MapEntry(key: fieldName, value: fieldInfo)
        in layout.fields.entries) {
      final convert = _convertValue(fieldInfo.type, fieldInfo.isOptional);
      toMapMethod.writeln('\'$fieldName\': this.$fieldName$convert,');
    }
    toMapMethod.writeln('''
  };
''');
    return toMapMethod.toString();
  }

  /// Generates a list of fields for layout descriptor of the object.
  String _generateDescriptor(LayoutHelper layout) {
    final descriptor = StringBuffer();
    descriptor.write('[');
    for (final MapEntry(key: fieldName, value: fieldInfo)
        in layout.fields.entries) {
      final fieldDesc = layout.nativeLayout[fieldName]!;
      final nestedIndex = switch (fieldInfo.type) {
        ObjectType() || ArrayType() => layout.nested[fieldInfo.type],
        _ => null,
      };
      // _weakRef(_offsetOf$...) allows us to check if the field is potentially
      // accessed in the program or tree-shaker determined that it is
      // unreachable and can be shaken away. If the field is never accessed
      // we don't need to include it into the descriptor.
      descriptor.write("if (_weakRef(_offsetOf\$$fieldName) != null) "
          "(name: '$fieldName',"
          " type: ${fieldInfo.type.nativeType},"
          " offset: ${fieldDesc.offset},"
          " presenceBit: ${fieldDesc.presenceBit},"
          " nestedIndex: $nestedIndex),");
    }
    descriptor.write(']');
    return descriptor.toString();
  }

  (LayoutHelper, Map<String, DartType>) _computeLayoutFromRepresentationType(
      ExtensionTypeElement element) {
    final jsonType = element.representation.type;

    if (jsonType is! InterfaceType) {
      throw InvalidGenerationSourceError(
        '`@FromJsonBytes` should only be to an extension type on `Json<>` type.',
        element: element,
      );
    }

    if (jsonType.element is! ExtensionTypeElement ||
        jsonType.element.name != 'Json' ||
        jsonType.element.library.source.uri != _decoderLibraryUri) {
      throw InvalidGenerationSourceError(
        '`@FromJsonBytes` should only be to an extension type on `Json<>` type.',
        element: element,
      );
    }

    final layoutType = jsonType.typeArguments.first as RecordType;

    final dartTypes = <String, DartType>{};
    final fields = <String, Field>{};
    for (var namedField in layoutType.namedFields) {
      dartTypes[namedField.name] = namedField.type;
      fields[namedField.name] = Field(
        isOptional:
            namedField.type.nullabilitySuffix == NullabilitySuffix.question,
        type: _translateType(namedField.name, namedField.type, element),
      );
    }

    return (LayoutHelper(fields), dartTypes);
  }

  String _generateAccessors(
    LayoutHelper layout,
    Map<String, DartType> dartTypes,
    String jsonRef,
  ) {
    final accessors = StringBuffer();
    for (var e in layout.fields.entries) {
      final fieldName = e.key;
      final fieldInfo = e.value;
      final fieldDesc = layout.nativeLayout[fieldName]!;

      String? presenceBitField;
      if (fieldInfo.isOptional) {
        presenceBitField = '_presenceBit\$$fieldName';
        accessors.writeln('''
  /// Index of the presence bit denoting whether `$fieldName` was present.
  static const int $presenceBitField = ${fieldDesc.presenceBit!};
''');
      }
      final offsetOfMethod = '_offsetOf\$$fieldName';
      final loadMethod =
          '${fieldInfo.type.loadMethod}${fieldInfo.isOptional ? 'OrNull' : ''}';
      final convertMethod = fieldInfo.type.convertMethod;
      final convertSuffix = convertMethod != '' ? '.$convertMethod()' : '';
      final presenceBitIndex =
          fieldInfo.isOptional ? ', $presenceBitField' : '';
      accessors.writeln('''
  /// Offset to the field `$fieldName` within `NativeJsonObject`.
  $_preferInline static int $offsetOfMethod() => ${fieldDesc.offset};

  /// Accessor for `$fieldName` field.
  $_preferInline ${dartTypes[fieldName]} get $fieldName =>
      $jsonRef.$loadMethod($offsetOfMethod()$presenceBitIndex)$convertSuffix;
''');
    }
    return accessors.toString();
  }

  static String _convertValue(TypeDesc type, bool isOptional) {
    return switch (type) {
      ObjectType() =>
        '${isOptional ? '?' : ''}.toMap(includeType: includeType)',
      ArrayType(isOptional: final isOptionalElement, :final elementType) =>
        switch (_convertValue(elementType, isOptionalElement)) {
          '' => '',
          final suffix =>
            '${isOptional ? '?' : ''}.map((v) => v$suffix).toList()',
        },
      _ => '',
    };
  }

  static TypeDesc _translateType(String name, DartType type, Element element) {
    if (type.isDartCoreString) {
      return PrimitiveType.string;
    } else if (type.isDartCoreInt) {
      return PrimitiveType.int;
    } else if (type.isDartCoreDouble) {
      return PrimitiveType.double;
    } else if (type.isDartCoreBool) {
      return PrimitiveType.bool;
    } else if (type is InterfaceType && type.element is ExtensionTypeElement) {
      final cls = type.element as ExtensionTypeElement;
      return ObjectType(cls.name);
    } else if (type.isDartCoreList) {
      final typeArg = (type as InterfaceType).typeArguments.first;
      return ArrayType(
        _translateType(name, typeArg, element),
        typeArg.nullabilitySuffix == NullabilitySuffix.question,
      );
    } else {
      throw InvalidGenerationSourceError(
        'Unsupported type $type for $name.',
        element: element,
      );
    }
  }
}

final _decoderLibraryUri = Uri.parse('package:dart_simdjson/decoder.dart');
const _preferInline = "@pragma('vm:prefer-inline')";
