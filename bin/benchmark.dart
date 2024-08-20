// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'dart:io';

import 'package:dart_simdjson/decoder.dart';
import '../test/schemas/tweet.dart' as tweet;

void main() async {
  final inputFile = File('twitter_timeline.json');
  if (!inputFile.existsSync()) {
    print(
        'Please download https://raw.githubusercontent.com/simdjson/simdjson-data/master/jsonexamples/twitter_timeline.json into current directory');
    return;
  }
  final bytes = inputFile.readAsBytesSync();

  const int expectedLength = 20;
  const int numIterations = 10 * 1000 * 1000 * 1000 ~/ (2 * 64 * 1024);
  {
    print('running simdjson based parser');
    final sw = Stopwatch()..start();
    List<tweet.Tweet>? result;
    for (var i = 0; i < numIterations; i++) {
      result = const Decoder<List<tweet.Tweet>>().convert(bytes);
    }
    final elapsedUs = sw.elapsedMicroseconds;
    final nsPerByte = (elapsedUs * 1000) / numIterations / bytes.length;
    print('$nsPerByte ns/byte');
    if (result?.length != expectedLength) {
      throw 'Expected length $expectedLength got ${result?.length}';
    }
  }
  {
    print('running fused Utf8+Json decoder');

    final utf8JsonDecoder = const Utf8Decoder().fuse(const JsonDecoder());

    final sw = Stopwatch()..start();
    Object? result;
    for (var i = 0; i < numIterations; i++) {
      result = utf8JsonDecoder.convert(bytes);
    }
    final elapsedUs = sw.elapsedMicroseconds;
    final nsPerByte = (elapsedUs * 1000) / numIterations / bytes.length;
    print('$nsPerByte ns/byte');
    if (result is! List || result.length != expectedLength) {
      throw 'Expected length $expectedLength got ${result.runtimeType} ${result is List ? result.length : ''}';
    }
  }
}
