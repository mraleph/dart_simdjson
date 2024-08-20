// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'impl.dart';

/// These helpers must match `capi.cc` code (`ArrayBuilder`, `ArrayChunk`,
/// `ArrayHeader`).
extension ArrayToListHelpers on NativeJsonObject {
  List<T> toListOfObject<T>() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk = Pointer.fromAddress(_data.address + 8).cast<_ChunkOfObject>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      return NativeJsonObject._(_arena, element) as T;
    });
  }

  List<T?> toListOfOptionalObject<T>() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk =
        Pointer.fromAddress(_data.address + 8).cast<_ChunkOfOptionalObject>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      final presence = chunk.ref.presence;
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      if ((presence & (1 << indexInChunk)) != 0) {
        return NativeJsonObject._(_arena, element) as T;
      } else {
        return null;
      }
    });
  }

  List<int> toListOfInt() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk = Pointer.fromAddress(_data.address + 8).cast<_ChunkOfInt>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      return element;
    });
  }

  List<int?> toListOfOptionalInt() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk =
        Pointer.fromAddress(_data.address + 8).cast<_ChunkOfOptionalInt>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      final presence = chunk.ref.presence;
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      if ((presence & (1 << indexInChunk)) != 0) {
        return element;
      } else {
        return null;
      }
    });
  }

  List<double> toListOfDouble() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk = Pointer.fromAddress(_data.address + 8).cast<_ChunkOfDouble>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      return element;
    });
  }

  List<double?> toListOfOptionalDouble() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk =
        Pointer.fromAddress(_data.address + 8).cast<_ChunkOfOptionalDouble>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      final presence = chunk.ref.presence;
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      if ((presence & (1 << indexInChunk)) != 0) {
        return element;
      } else {
        return null;
      }
    });
  }

  List<bool> toListOfBool() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk = Pointer.fromAddress(_data.address + 8).cast<_ChunkOfBool>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      return element;
    });
  }

  List<bool?> toListOfOptionalBool() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk =
        Pointer.fromAddress(_data.address + 8).cast<_ChunkOfOptionalBool>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      final presence = chunk.ref.presence;
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      if ((presence & (1 << indexInChunk)) != 0) {
        return element;
      } else {
        return null;
      }
    });
  }

  List<String> toListOfString() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk = Pointer.fromAddress(_data.address + 8).cast<_ChunkOfString>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      return element.toDartString();
    });
  }

  List<String?> toListOfOptionalString() {
    // First word is length. Followed by 64 element chunks.
    final length = _data.cast<Int64>().value;
    var chunk =
        Pointer.fromAddress(_data.address + 8).cast<_ChunkOfOptionalString>();
    return List.generate(length, (i) {
      final indexInChunk = i & (capi.kArrayChunkSize - 1);
      final element = chunk.ref.elements[indexInChunk];
      final presence = chunk.ref.presence;
      if (indexInChunk == (capi.kArrayChunkSize - 1)) {
        chunk = chunk.ref.next;
      }
      if ((presence & (1 << indexInChunk)) != 0) {
        return element.toDartString();
      } else {
        return null;
      }
    });
  }
}

final class _ChunkOfObject extends Struct {
  @Array<Pointer<Uint8>>(capi.kArrayChunkSize)
  external Array<Pointer<Uint8>> elements;

  external Pointer<_ChunkOfObject> next;
}

final class _ChunkOfOptionalObject extends Struct {
  @Int64()
  external int presence;

  @Array<Pointer<Uint8>>(capi.kArrayChunkSize)
  external Array<Pointer<Uint8>> elements;

  external Pointer<_ChunkOfOptionalObject> next;
}

final class _ChunkOfInt extends Struct {
  @Array<Int64>(capi.kArrayChunkSize)
  external Array<Int64> elements;

  external Pointer<_ChunkOfInt> next;
}

final class _ChunkOfOptionalInt extends Struct {
  @Int64()
  external int presence;

  @Array<Int64>(capi.kArrayChunkSize)
  external Array<Int64> elements;

  external Pointer<_ChunkOfOptionalInt> next;
}

final class _ChunkOfDouble extends Struct {
  @Array<Double>(capi.kArrayChunkSize)
  external Array<Double> elements;

  external Pointer<_ChunkOfDouble> next;
}

final class _ChunkOfOptionalDouble extends Struct {
  @Int64()
  external int presence;

  @Array<Double>(capi.kArrayChunkSize)
  external Array<Double> elements;

  external Pointer<_ChunkOfOptionalDouble> next;
}

final class _ChunkOfString extends Struct {
  @Array<Pointer<Utf8>>(capi.kArrayChunkSize)
  external Array<Pointer<Utf8>> elements;

  external Pointer<_ChunkOfString> next;
}

final class _ChunkOfOptionalString extends Struct {
  @Int64()
  external int presence;

  @Array<Pointer<Utf8>>(capi.kArrayChunkSize)
  external Array<Pointer<Utf8>> elements;

  external Pointer<_ChunkOfOptionalString> next;
}

final class _ChunkOfBool extends Struct {
  @Array<Bool>(capi.kArrayChunkSize)
  external Array<Bool> elements;

  external Pointer<_ChunkOfBool> next;
}

final class _ChunkOfOptionalBool extends Struct {
  @Int64()
  external int presence;

  @Array<Bool>(capi.kArrayChunkSize)
  external Array<Bool> elements;

  external Pointer<_ChunkOfOptionalBool> next;
}
