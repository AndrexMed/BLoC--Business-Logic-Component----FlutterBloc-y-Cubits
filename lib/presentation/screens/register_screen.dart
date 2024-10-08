import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: const _RegisterView());
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

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(children: [
      CustomTextFormField(
        label: 'User Name',
        hintText: 'Enter your user name',
        onChanged: (p0) {},
        validator: (p0) {
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      CustomTextFormField(
        label: 'Email',
        hintText: 'Enter your email',
        onChanged: (p0) {},
        validator: (p0) {
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      CustomTextFormField(
        label: 'Password',
        hintText: 'Enter your password',
        onChanged: (p0) {},
        validator: (p0) {
          return null;
        },
        obscureText: true,
      ),
      const SizedBox(
        height: 10,
      ),
      FilledButton.tonalIcon(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right),
          label: const Text('Register')),
    ]));
  }
}
