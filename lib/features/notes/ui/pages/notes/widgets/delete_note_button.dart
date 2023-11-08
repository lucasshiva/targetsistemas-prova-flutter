import 'package:flutter/material.dart';

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        decoration: BoxDecoration(
          color: Colors.red[800],
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
