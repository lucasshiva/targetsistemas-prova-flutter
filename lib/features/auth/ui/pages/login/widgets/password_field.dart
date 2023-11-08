import 'package:flutter/material.dart';

import '../../../../utils/field_validator.dart';
import 'filled_text_form_field.dart';
import 'form_field_label.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormFieldLabel("Senha"),
        FilledTextFormField(
          controller: controller,
          preffixIcon: const Icon(Icons.lock),
          isPasswordField: true,
          validator: (value) {
            final errorText = loginAndPasswordValidator(value);
            if (errorText != null) return errorText;

            // Não tivemos erros ao validar a senha até o momento.
            if (value!.length < 2) {
              return "A senha não pode ter menos de dois caracteres";
            }

            return null;
          },
        ),
      ],
    );
  }
}
