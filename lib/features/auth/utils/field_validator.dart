import 'package:flutter/material.dart';

String? loginAndPasswordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "O campo não pode ser vazio";
  }

  if (value.length > 20) {
    return "O campo precisa ter no máximo 20 caracteres";
  }

  if (value.characters.last == " ") {
    return "O campo não pode terminar com espaço";
  }

  return null;
}
