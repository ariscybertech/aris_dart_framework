import '../field_code_generator.dart';
import '../field_descriptor.dart';

class EntityFieldCodeGenerator extends FieldCodeGenerator {
  EntityFieldCodeGenerator(
      FieldDescriptor fieldDescriptor, bool hasDefaultsProvider)
      : super(fieldDescriptor, hasDefaultsProvider);

  @override
  bool get usesKh => true;

  @override
  String get toMapExpression =>
      ''' const ${fieldDescriptor.fieldElementTypeName}MapMapper().toMap(instance.$fieldName, \$kh)''';

  @override
  String get toNullableMapExpression => '''
      (instance.$fieldName == null ? null :
      const ${fieldDescriptor.fieldElementTypeName}MapMapper().toMap(instance.$fieldName!, \$kh)
      )''';

  @override
  String fromMapExpression(String sourceExpression) =>
      ''' const ${fieldDescriptor.fieldElementTypeName}MapMapper().fromMap($sourceExpression, \$kh)''';

  @override
  String get fromNullableMapExpression => '''
  (map[\'$mapName\'] != null
      ? const ${fieldDescriptor.fieldElementTypeName}MapMapper().fromMap(map[\'$mapName\'], \$kh)
      : null)''';

  @override
  String get fieldNamesClassGetter =>
      '''\$${fieldDescriptor.fieldElementTypeName}FieldNames get $fieldName =>
             \$${fieldDescriptor.fieldElementTypeName}FieldNames(
               keyHandler: keyHandler,
               fieldName: prefix + _$fieldName,); ''';
}
