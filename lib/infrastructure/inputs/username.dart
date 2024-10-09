import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length, regex }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) {
      return null;
    }

    if (displayError == UsernameError.empty) {
      return 'User name is required';
    }

    if (displayError == UsernameError.length) {
      return 'User name must be at least 6 characters';
    }

    if (displayError == UsernameError.regex) {
      return 'User name can only contain letters, numbers, and underscores';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty) {
      return UsernameError.empty;
    }
    if (value.trim().isEmpty) {
      return UsernameError.empty;
    }
    if (value.length < 6) {
      return UsernameError.length;
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return UsernameError.regex;
    }

    return null;
  }
}
