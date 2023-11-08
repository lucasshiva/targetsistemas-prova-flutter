import 'package:flutter/material.dart';

class EditNoteButton extends StatelessWidget {
  const EditNoteButton({
    super.key,
    this.size = 30,
    this.onPressed,
    this.isActive = false,
  });

  final double? size;
  final bool isActive;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.edit,
        size: size,
        color: Colors.black,
      ),
      isSelected: isActive,
      selectedIcon: Icon(
        Icons.edit,
        size: size,
        color: Colors.green,
      ),
    );
  }
}
