import 'package:flutter/material.dart';

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Por favor, digite o campo Email corretamente...';
  }
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Por favor, digite o campo Email corretamente...';
  }
  return null;
}

void validateForm(BuildContext context, bool validate) {
  if (validate) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Processando dados')));
  }
}
