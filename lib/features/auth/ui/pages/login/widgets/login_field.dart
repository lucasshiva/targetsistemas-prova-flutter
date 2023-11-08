import 'package:flutter/material.dart';

import '../../../../utils/field_validator.dart';
import 'filled_text_form_field.dart';
import 'form_field_label.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormFieldLabel("Usuário"),
        FilledTextFormField(
          controller: controller,
          preffixIcon: const Icon(Icons.person),
          validator: loginAndPasswordValidator,
        ),
      ],
    );
  }
}
