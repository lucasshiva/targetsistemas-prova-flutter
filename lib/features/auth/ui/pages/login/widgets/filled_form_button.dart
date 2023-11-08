import 'package:flutter/material.dart';

class FilledFormButton extends StatelessWidget {
  const FilledFormButton({
    super.key,
    this.width,
    this.onPressed,
  });

  final double? width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: 45,
      child: FilledButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xFF44bd6e)),
        ),
        onPressed: onPressed,
        child: Text(
          "Entrar",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
