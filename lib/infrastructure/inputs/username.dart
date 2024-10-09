import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty) {
      return UsernameError.empty;
    }
    if (value.trim().isEmpty) {
      return UsernameError.empty;
    }
    if (value.length < 3) {
      return UsernameError.empty;
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return UsernameError.empty;
    }

    return null;
  }
}
