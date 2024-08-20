// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file configures native assets build.
//
// See https://dart.dev/interop/c-interop#native-assets

import 'package:logging/logging.dart';
import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> args) async {
  await build(args, (config, output) async {
    final packageName = config.packageName;
    final cbuilder = CBuilder.library(
      name: packageName,
      assetName: 'src/generated/capi.dart',
      language: Language.cpp,
      sources: [
        'src/capi.cpp',
        'src/third_party/simdjson/simdjson.cpp',
      ],
      defines: {'SIMDJSON_EXCEPTIONS': '0'},
      flags: ['--std=c++20', '-O3', '-g', '-fno-omit-frame-pointer'],
    );
    await cbuilder.run(
      config: config,
      output: output,
      logger: Logger('')
        ..level = Level.ALL
        ..onRecord.listen((record) => print(record.message)),
    );
  });
}
