import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilledTextFormField extends StatelessWidget {
  const FilledTextFormField({
    super.key,
    this.preffixIcon,
    this.isPasswordField = false,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
  });

  final Widget? preffixIcon;
  final bool isPasswordField;
  final String? Function(String? value)? validator;
  final void Function(String value)? onFieldSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          if (isPasswordField)
            FilteringTextInputFormatter.allow(RegExp("^[a-zA-Z0-9]*\$")),
        ],
        style: const TextStyle(color: Colors.black),
        obscureText: isPasswordField,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          errorStyle: theme.textTheme.bodyMedium?.copyWith(color: Colors.redAccent),
          errorMaxLines: 2,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: preffixIcon,
          prefixIconColor: Colors.black,
        ),
      ),
    );
  }
}
