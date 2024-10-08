import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.validator,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      //borderSide: BorderSide(color: colors.primary)
    );

    return TextFormField(
        obscureText: obscureText ?? false,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.person),
          enabledBorder: border,
          isDense: true,
          focusedBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(color: colors.primary),
          ),
          labelText: label,
          hintText: hintText ?? label,
          focusColor: colors.primary,
          errorText: errorText ?? '',
          errorBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(color: Colors.red),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(color: Colors.red),
          ),
        ));
  }
}
