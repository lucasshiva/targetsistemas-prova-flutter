import 'package:flutter/material.dart';

import '../../../../../../core/widgets/filled_text_field.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
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
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: screenSize.width * 0.75,
      height: 50,
      child: FilledTextField(
        focusNode: focusNode,
        controller: controller,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
