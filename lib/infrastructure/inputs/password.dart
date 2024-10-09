import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError {
  empty,
  length,
  noLowercase,
  noUppercase,
  noNumber,
  noSymbol
}

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (displayError == PasswordError.length) {
      return 'Password must be at least 6 characters';
    }
    if (displayError == PasswordError.noLowercase) {
      return 'Password must contain at least one lowercase letter';
    }
    if (displayError == PasswordError.noUppercase) {
      return 'Password must contain at least one uppercase letter';
    }
    if (displayError == PasswordError.noNumber) {
      return 'Password must contain at least one number';
    }
    if (displayError == PasswordError.noSymbol) {
      return 'Password must contain at least one symbol';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) {
      return PasswordError.empty;
    }
    if (value.length < 6) {
      return PasswordError.length;
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return PasswordError.noLowercase;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return PasswordError.noUppercase;
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return PasswordError.noNumber;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return PasswordError.noSymbol;
    }

    return null;
  }
}
