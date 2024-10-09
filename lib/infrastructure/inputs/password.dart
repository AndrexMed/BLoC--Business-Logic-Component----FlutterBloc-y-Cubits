import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) {
      return PasswordError.empty;
    }
    if (value.length < 6) {
      return PasswordError.empty;
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return PasswordError.empty;
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return PasswordError.empty;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return PasswordError.empty;
    }

    return null;
  }
}
