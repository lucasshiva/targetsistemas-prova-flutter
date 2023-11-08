import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  const FilledTextField({
    super.key,
    this.focusNode,
    this.controller,
    this.onSubmitted,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String value)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onSubmitted: onSubmitted,
      controller: controller,
      focusNode: focusNode,
      textAlign: TextAlign.center,
      style: theme.textTheme.titleMedium?.copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Digite seu texto",
        hintStyle: theme.textTheme.titleLarge?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
