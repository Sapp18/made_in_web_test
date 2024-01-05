import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/app.dart';

class MainTextFormField extends StatelessWidget {
  final AutovalidateMode? autovalidateMode;
  final bool autofocus;
  final bool obscureText;
  final bool readOnly;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? counterText;
  final String? Function(String?)? validator;
  final String? helperText;
  final String? hintText;
  final String? initialValue;
  final String? labelText;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const MainTextFormField({
    Key? key,
    this.autofocus = false,
    this.autovalidateMode,
    this.controller,
    this.counterText,
    this.focusNode,
    this.helperText,
    this.hintText,
    this.icon,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.readOnly = false,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      obscureText: obscureText,
      obscuringCharacter: '*',
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      style: AppStyle.w400(14),
      textCapitalization: textCapitalization,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: counterText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        icon: icon,
      ),
    );
  }
}
