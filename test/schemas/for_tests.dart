import 'package:dart_simdjson/decoder.dart';

part 'for_tests.g.dart';

@FromJsonBytes()
extension type StringField(Json<({String f})> json) {}

@FromJsonBytes()
extension type OptionalStringField(Json<({String? f})> json) {}

@FromJsonBytes()
extension type IntField(Json<({int f})> json) {}

@FromJsonBytes()
extension type OptionalIntField(Json<({int? f})> json) {}

@FromJsonBytes()
extension type BoolField(Json<({bool f})> json) {}

@FromJsonBytes()
extension type OptionalBoolField(Json<({bool? f})> json) {}

@FromJsonBytes()
extension type DoubleField(Json<({double f})> json) {}

@FromJsonBytes()
extension type OptionalDoubleField(Json<({double? f})> json) {}

@FromJsonBytes()
extension type ObjectField(Json<({StringField f})> json) {}

@FromJsonBytes()
extension type OptionalObjectField(Json<({StringField? f})> json) {}

@FromJsonBytes()
extension type ListOfObjectField(Json<({List<StringField> f})> json) {}

@FromJsonBytes()
extension type ListOfIntField(Json<({List<int> f})> json) {}

@FromJsonBytes()
extension type ListOfDoubleField(Json<({List<double> f})> json) {}

@FromJsonBytes()
extension type ListOfStringField(Json<({List<String> f})> json) {}

@FromJsonBytes()
extension type ListOfBoolField(Json<({List<bool> f})> json) {}

@FromJsonBytes()
extension type ListOfOptionalObjectField(Json<({List<StringField?> f})> json) {}

@FromJsonBytes()
extension type ListOfOptionalIntField(Json<({List<int?> f})> json) {}

@FromJsonBytes()
extension type ListOfOptionalDoubleField(Json<({List<double?> f})> json) {}

@FromJsonBytes()
extension type ListOfOptionalStringField(Json<({List<String?> f})> json) {}

@FromJsonBytes()
extension type ListOfOptionalBoolField(Json<({List<bool?> f})> json) {}
