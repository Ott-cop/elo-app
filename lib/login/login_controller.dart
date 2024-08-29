import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ValidateForm {
  String? email;
  String? password;

  String? validateEmail(String? email) {
    this.email = email;
    if (email == null || email.isEmpty) {
      return 'Por favor, digite o campo Email corretamente...';
    }
    return null;
  }

  String? validatePassword(String? password) {
    this.password = password;
    if (password == null || password.isEmpty) {
      return 'Por favor, digite o campo Senha corretamente...';
    }
    if (password.length < 5 || password.length > 16) {
      return 'Por favor, digite entre 5 e 15 caracteres';
    }
    return null;
  }

  void validateForm(BuildContext context, bool validate) {
    if (validate) {
      if ((email == 'teste@teste.com') && (password == '12345678')) {
        toast(
                message: "Login feito com sucesso!",
                color: Colors.green,
                icon: const Icon(Icons.login))
            .show(context);
        Navigator.of(context).pushReplacementNamed("/");
      } else {
        toast(
                icon: const Icon(Icons.close),
                color: Colors.red,
                message: "As credenciais estão incorretas.")
            .show(context);
      }
    }
  }
}
