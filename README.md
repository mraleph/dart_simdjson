This repository contains a JSON parser developed as a demo / experiment for
the talk I have given at [Flutter'n'Friends](https://www.flutterfriends.dev/)
["Learning something about Dart performance by optimizing `jsonDecode`"](http://mrale.ph/talks/fnf2024/).

> [!WARNING]
>
> This is not a production quality code, it will never be published on pub and
> any use of it in your projects is at your own risk.

The main purpose for publishing this code is to illustrate some ideas and
Dart features which I consider important for the Dart community to be aware
about. These are listed in this README.md.

If you want to dive into the code I suggest starting by looking at the
test `tests/dart_simdjson_test.dart` and associated generated code in
`tests/schemas/`. Alternatively you can look at `bin/benchmark.dart`.

Documentation on `Json` extension type in `lib/decoder.dart` describes
how to define your own schemas.

# Running the code

- Regenerating code for classes annotated with `@FromJsonBytes`:

    ```console
    $ dart --enable-experiment=native-assets run build_runner build
    ```

- Regenerating FFI bindings (if you edit `src/capi.h`):

    ```console
    $ dart --enable-experiment=native-assets run ffigen --config ffigen.yaml
    ```

- Running tests:

    ```console
    $ dart --enable-experiment=native-assets test
    ```

- Running `benchmark.dart`:

    ```console
    $ curl -O https://raw.githubusercontent.com/simdjson/simdjson-data/master/jsonexamples/twitter_timeline.json
    $ dart --enable-experiment=native-assets run bin/benchmark.dart
    running simdjson based parser
    1.4811918509707052 ns/byte
    running fused Utf8+Json decoder
    5.10118787410763 ns/byte
    $ dart --enable-experiment=native-assets build bin/benchmark.dart
    $ bin/benchmark/benchmark.exe
    running simdjson based parser
    0.7803441346580962 ns/byte
    running fused Utf8+Json decoder
    4.739755141242795 ns/byte
    ```

> [!NOTE]
>
> AOT build of the benchmark demonstrates ability for tree-shaker to
> influence the parser: it does not parse fields which are not accessed.
> That is why benchmark gets so much faster: it simply skips over most of the
> JSON.

# Features to highlight

## Native Assets

This package uses [native assets][] feature to include native dependencies like
[`simdjson`][] and [`ankerl::unordered_dense`][]. Native assets provide a way
to create Dart packages which depend on native code and have Dart toolchain
take care of building these dependencies and packaging resulting binaries as
described in `hook/build.dart` script.

If you clone this package you can simply run:

```console
$ dart --enable-experiment=native-assets test
```

and that will take care of automatically building shared library from C++ code
which Dart code depends on.

Native assets are not limited to a specific programming language: fundamentally
it is a protocol which allows a package to _hook_ into the process of building
and packaging Dart code and provide additional artifacts.

You can follow the development of this feature on [dart-lang/sdk#50565][].

[native assets]: https://dart.dev/interop/c-interop#native-assets
[`simdjson`]: https://github.com/simdjson/simdjson
[`ankerl::unordered_dense`]: https://github.com/martinus/unordered_dense
[dart-lang/sdk#50565]: https://github.com/dart-lang/sdk/issues/50565

## Extension types for Data Model

[Extension types][] is a feature introduced in [Dart 3.3][]. This feature
allows you to define a _compile time_ abstraction over an underlying
_representation_ type. You can think about extension types as a more powerful
and more strict version of type aliases (`typedef`). Extension types
unlike type aliases are not erased immediately on the early stages of
compilation and can hide underlying representation. However just like type
aliases they don't exist in runtime: they are erased and are replaced with
underlying representation type.

```dart
typedef TypeAlias = int;

extension type ExtType(int value) {
}

// This compiles because type aliases are erased very early.
TypeAlias sum1(TypeAlias a, TypeAlias b) =>
  a + b;

// This does not compile because extension types are not
// erased as early and thus can hide the underlying representation.
ExtType sum2(ExtType a, ExtType b) =>
  a + b;
//  ^
//  The operator '+' isn't defined for the type ExtType

void main() {
  // Both of these will print true.
  print(<TypeAlias>[] is List<int>);
  print(<ExtType>[] is List<int>);

  final list = <ExtType>[];
  list.add(1);  // compilation error
  //       ^
  // The argument of type 'int' can't be assigned to the parameter type 'ExtType'

  // However there is no runtime error here:
  (list as List<int>).add(1);
  // Because in runtime `ExtType` is simply `int`.
}
```

Extension types play large role in [static JS interop][] where they are used to
define facades on top of an underlying opaque `JSObject` type.

This package utilizes them in a similar fashion: JSON deserializer produces
opaque `NativeJsonObjects` which are then viewed[^1] through extension types
which define accessors.

Designing deserialization library around extension types is an experiment which
tries to address poor treeshakability of the fully reified model: where a Dart
class is created for every type in the schema. Extension types don't contribute
to the binary size in the same way as fully reified classes do. All their
methods are statically dispatched and the extension type definition is erased.

[Extension types]: https://dart.dev/language/extension-types
[Dart 3.3]: https://dart.dev/guides/language/evolution#dart-3-3
[static JS interop]: https://dart.dev/interop/js-interop/usage
[^1]: One of the names considered for extension types feature was in fact _views_.

## Native inflates - Dart consumes

Here is the core idea behind the implementation of this package:

* Dart builds a _descriptor_ (see `LayoutDescriptor` in `lib/src/impl.dart` and
`ObjectLayoutDescriptor` in `src/capi.cc`) which describes which names of JSON
fields it is interested in, what types do they have and an _offset_ at which
to store them (relative to the start of the memory allocated for the result).
* Native code takes JSON bytes and uses `simdjson` library to parse it and
extracts the fields requested by the layout descriptor.
* Dart can now access extracted data by accessing it at offsets it specified
in the descriptor.

This design mimics the design of [upb][] protobuf runtime.

For example parsing `{"a": 10, "b": 1.25, "c": {"d": true}}` using a descriptor
which specifies:

```
{
  "a": @0 int,     // "a" is an integer field, store at offset 0
  "b": @8 double,  // "b" is a double field, store at offset 8
  "c": @16 {       // "c" is a nested object, store at offset 16
    "d": @0 bool   // "d" is a boolean field store at offset 0
  }
}
```

will result in the following structure in memory:

```
            Dart Heap | Native Heap
                      |
JsonNativeObject      |
+--------------+  /----------->+------+
|     _data *----/    |        |    10|
|              |      |        |  1.25|
+--------------+      |        |     *---\
                      |        +------+  |
                      |        +------+<-/
                      |        |  true|
                      |        +------+
                      |
```

Now if Dart wants to access `a` it needs to load an integer at offset 0 from
`_data` and for `b` it needs to load double at offset 8:

```dart
extension on JsonNativeObject {
  int get a =>
    Pointer<Int64>.fromAddress(_data.address + 0).value;
  double get b =>
    Pointer<Double>.fromAddress(_data.address + 8).value;
}
```

[upb]: https://github.com/protocolbuffers/protobuf/blob/17673f5b90b4a73d8633a25650a4f7d1ae0aff72/docs/upb/design.md

## Tree-shaking of unused descriptors

Often large objects are only consumed partially by the program, e.g. just a few
fields are accessed from many deserialized. If full validation of the input is
not important (e.g. it is enough to validate just the fields accessed) then
some sort of lazy parsing could be employed to reduce parsing costs. This
however introduces a problem that accessors start throwing validation
errors (because they perform parsing).

The code of this package offers a different approach based on
[`@pragma('weak-tearoff-reference')`][weak-tearoff-reference]. It is inspired
by the concept of [weak symbols][] in ELF and allows the program to _peak_
into the results of the tree-shaking:

```dart
@pragma('weak-tearoff-reference')
T Function()? _weakRef<T>(T Function()? x) => x;

int something() {
  return 10;
}

if (_weakRef(something) != null) {
  print('is present: something is used somewhere in the program');
} else {
  print('was tree-shaken: something is not used anywhere in the program');
}
```

The idea here is that each field accessor generated from JSON schemas references
a separate static function `_offsetOf$<fieldName>()` to get offset of the corresponding field. This creates a link between accessor and the static
function: if accessor is accessed in the program then static function is not
tree-shaken, and the other way around. We can use this information to prune
unused field descriptors from the layout:

```dart
/// Offset to the field `created_at` within `NativeJsonObject`.
static int _offsetOf$created_at() => 16;

/// Accessor for `created_at` field.
String get created_at => this._.loadString(_offsetOf$created_at());

static final _descriptor = LayoutDescriptor<Tweet>.unlinked([
  if (_weakRef(_offsetOf$created_at) != null)
    (
    name: 'created_at',
    type: FieldType.kString,
    offset: 16,
    presenceBit: null,
    nestedIndex: null
    ),
  ...
];
```

This way `_descriptor` will only include an entry for `created_at` if `created_at` getter is not tree-shaken.

[weak-tearoff-reference]: https://github.com/dart-lang/sdk/blob/main/runtime/docs/compiler/pragmas_recognized_by_compiler.md#declaring-a-static-weak-reference-intrinsic-method
[weak symbols]: https://en.wikipedia.org/wiki/Weak_symbol


