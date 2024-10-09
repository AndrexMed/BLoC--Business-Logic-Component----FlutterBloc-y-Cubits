part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final String userName;
  final String email;
  final String password;
  final FormStatus formStatus;

  const RegisterFormState({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.formStatus = FormStatus.invalid,
  });

  RegisterFormState copyWith({
    String? userName,
    String? email,
    String? password,
    FormStatus? formStatus,
  }) {
    return RegisterFormState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object> get props => [userName, email, password, formStatus];
}
