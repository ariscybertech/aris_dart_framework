import '../field_code_generator.dart';
import '../field_descriptor.dart';

class IntFieldCodeGenerator extends FieldCodeGenerator {
  IntFieldCodeGenerator(FieldDescriptor fieldDescriptor, bool isAbstract)
      : super(fieldDescriptor, isAbstract);

  @override
  String get defaultExpression => '0';
}
