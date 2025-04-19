import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError { invalid }

class Password extends FormzInput<String, ConfirmedPasswordValidationError> {
  const Password.pure([this.password = '']) : super.pure('');

  const Password.dirty([this.password = '']) : super.dirty('');

  final String password;

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    return value == password ? null : ConfirmedPasswordValidationError.invalid;
  }
}
