import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/email.dart';
import 'package:forms_app/infrastructure/inputs/password.dart';
import 'package:forms_app/infrastructure/inputs/username.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void userNameChanged(String value) {
    final username = Username.dirty(value);

    // emit(state.copyWith(userName: value));
    emit(state.copyWith(
        userName: username,
        isValid: Formz.validate([username, state.password, state.email])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password, state.userName])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.userName, state.email])));
  }

  void registerFormSubmitted() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      userName: Username.dirty(state.userName.value),
      email: Email.dirty(state.email.value),
      password: Password.dirty(state.password.value),
      isValid: Formz.validate([state.userName, state.email, state.password]),
    ));
  }
}
