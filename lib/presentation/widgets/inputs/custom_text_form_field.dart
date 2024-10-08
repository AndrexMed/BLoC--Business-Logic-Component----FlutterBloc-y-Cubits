import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      //borderSide: BorderSide(color: colors.primary)
    );

    return TextFormField(
      onChanged: (value) {
        print(value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide:
              border.borderSide.copyWith(color: colors.primaryContainer),
        ),
        labelText: 'Name',
        hintText: 'Enter your name',
      ),
    );
  }
}
