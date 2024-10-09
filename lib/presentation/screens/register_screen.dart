import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const _RegisterView(),
        ));
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // String username = '';

  // String email = '';

  // String password = '';

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
        key: _formKey,
        child: Column(children: [
          CustomTextFormField(
            label: 'User Name',
            hintText: 'Enter your user name',
            // onChanged: (value) => username = value,
            onChanged: registerCubit.userNameChanged,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'User name is required';
              }
              if (p0.trim().isEmpty) {
                return 'User name is required';
              }
              if (p0.length < 3) {
                return 'User name must be at least 3 characters';
              }
              if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(p0)) {
                return 'User name can only contain letters, numbers, and underscores';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Enter your email',
            // onChanged: (value) => email = value,
            onChanged: registerCubit.emailChanged,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Email is required';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(p0)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Password',
            hintText: 'Enter your password',
            // onChanged: (value) => password = value,
            onChanged: registerCubit.passwordChanged,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Password is required';
              }
              if (p0.length < 6) {
                return 'Password must be at least 6 characters';
              }
              if (!RegExp(r'[A-Za-z]').hasMatch(p0)) {
                return 'Password must contain at least one letter';
              }
              if (!RegExp(r'\d').hasMatch(p0)) {
                return 'Password must contain at least one number';
              }
              if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(p0)) {
                return 'Password must contain at least one special character';
              }
              return null;
            },
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton.tonalIcon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              icon: const Icon(Icons.chevron_right),
              label: const Text('Register')),
        ]));
  }
}
