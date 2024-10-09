import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, length, regex }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) {
      return null;
    }

    if (displayError == EmailError.empty) {
      return 'Email can\'t be empty';
    }

    if (displayError == EmailError.length) {
      return 'Email must be at least 6 characters';
    }

    if (displayError == EmailError.regex) {
      return 'Invalid email';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty) {
      return EmailError.empty;
    }

    if (value.trim().isEmpty) {
      return EmailError.empty;
    }
    if (value.length < 6) {
      return EmailError.length;
    }

    if (!_emailRegExp.hasMatch(value)) {
      return EmailError.regex;
    }

    return null;
  }
}
