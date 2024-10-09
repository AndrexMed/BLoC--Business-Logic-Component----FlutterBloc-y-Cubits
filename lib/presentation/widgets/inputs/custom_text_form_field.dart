import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final Function(String)? onChanged;
  //final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.errorText,
    this.onChanged,
    //this.validator,
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
        onChanged: onChanged,
        //validator: validator,
        decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hintText,
          errorText: errorText,
          focusColor: colors.primary,
        ));
  }
}
