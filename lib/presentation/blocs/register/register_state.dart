part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  // final String userName;
  final Username userName;

  final String email;
  final Password password;
  final FormStatus formStatus;
  final bool isValid;

  const RegisterFormState({
    this.userName = const Username.pure(),
    this.email = '',
    this.password = const Password.pure(),
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
  });

  RegisterFormState copyWith({
    // String? userName,
    Username? userName,
    String? email,
    Password? password,
    FormStatus? formStatus,
    bool? isValid,
  }) {
    return RegisterFormState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [userName, email, password, formStatus, isValid];
}
