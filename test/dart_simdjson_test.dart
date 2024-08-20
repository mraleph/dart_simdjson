import 'dart:convert';

import 'package:test/test.dart';

import 'package:dart_simdjson/decoder.dart';
import 'schemas/for_tests.dart';

extension<K> on Map<K, dynamic> {
  Map<K, dynamic> get nonNulls => {
        for (var e in entries)
          if (e.value != null) e.key: e.value,
      };
}

void main() {
  void testRoundTrip<T>(
    String name,
    Map<String, dynamic> input,
    T Function(Uint8List) Function(Decoder<T>) decode,
    Map<String, dynamic> Function(T) toMap,
  ) {
    test(name, () {
      final jsonBytes = utf8.encode(jsonEncode(input));
      final v = decode(Decoder<T>())(jsonBytes);

      expect(toMap(v).nonNulls, equals(input.nonNulls));
    });
  }

  // String fields
  testRoundTrip<StringField>(
    'string',
    {'f': 'value'},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalStringField>(
    'string? present',
    {'f': 'value'},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalStringField>(
    'string? null',
    {'f': null},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalStringField>(
    'string? absent',
    {},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );

  // Int fields.
  testRoundTrip<IntField>(
    'int',
    {'f': 10},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalIntField>(
    'int? present',
    {'f': 10},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalIntField>(
    'int? null',
    {'f': null},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalIntField>(
    'int? absent',
    {},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );

  // Bool fields
  testRoundTrip<BoolField>(
    'bool',
    {'f': true},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalBoolField>(
    'bool? present',
    {'f': false},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalBoolField>(
    'bool? null',
    {'f': null},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalBoolField>(
    'bool? absent',
    {},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );

  // Double fields
  testRoundTrip<DoubleField>(
    'double',
    {'f': 10.25},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalDoubleField>(
    'double? present',
    {'f': 10.5},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalDoubleField>(
    'double? null',
    {'f': null},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalDoubleField>(
    'double? absent',
    {},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );

  // Object fields
  testRoundTrip<ObjectField>(
    'object',
    {
      'f': {'f': 'string value'}
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalObjectField>(
    'object? present',
    {
      'f': {'f': 'another value'}
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalObjectField>(
    'object? null',
    {'f': null},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<OptionalObjectField>(
    'object? absent',
    {},
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );

  // ListOfObjectField
  testRoundTrip<ListOfObjectField>(
    'list of object',
    {
      'f': [
        {'f': 'v'}
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfObjectField>(
    'list of object - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) {'f': 'v$i'},
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfIntField>(
    'list of int',
    {
      'f': [0, 22]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfIntField>(
    'list of int - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) i,
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfDoubleField>(
    'list of double',
    {
      'f': [0.25]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfDoubleField>(
    'list of double - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) i + 0.25,
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfStringField>(
    'list of string',
    {
      'f': ["0.25"]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfStringField>(
    'list of string - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) "v$i",
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfBoolField>(
    'list of bool',
    {
      'f': [true]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfBoolField>(
    'list of bool - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) i.isEven,
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );

  testRoundTrip<ListOfOptionalObjectField>(
    'list of object?',
    {
      'f': [
        {'f': 'v'},
        null,
        {'f': 'v'}
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalObjectField>(
    'list of object? - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) i.isEven ? null : {'f': 'v$i'},
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalIntField>(
    'list of int?',
    {
      'f': [0, null, 22]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalIntField>(
    'list of int? - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) i.isEven ? i : null,
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalDoubleField>(
    'list of double?',
    {
      'f': [0.25, null, -0.25]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalDoubleField>(
    'list of double? - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) i.isEven ? i + 0.25 : null,
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalStringField>(
    'list of string?',
    {
      'f': ["0.25", null, "value"]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalStringField>(
    'list of string? - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) i.isEven ? null : "v$i",
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalBoolField>(
    'list of bool?',
    {
      'f': [true, null, false]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
  testRoundTrip<ListOfOptionalBoolField>(
    'list of bool? - long',
    {
      'f': [
        for (var i = 0; i < 128; i++) i % 3 == 0 ? null : i.isEven,
      ]
    },
    (decoder) => decoder.convert,
    (v) => v.toMap(),
  );
}
