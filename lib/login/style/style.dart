import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class IconStyleNotifier extends ChangeNotifier {
  final focusEmail = FocusNode();
  final focusPassword = FocusNode();

  static Color colorIcon = Colors.white;

  Color emailState = colorIcon;
  Color passwordState = colorIcon;

  onFocusChangeEmail() {
    if (focusEmail.hasFocus) {
      emailState = Global().primaryColor;
      notifyListeners();
    } else {
      emailState = Colors.white;
      notifyListeners();
    }
  }

  onFocusChangePassword() {
    if (focusPassword.hasFocus) {
      passwordState = Global().primaryColor;
      notifyListeners();
    } else {
      passwordState = Colors.white;
      notifyListeners();
    }
  }
}

InputDecoration inputDecorationStyle(String label, Color color, IconData icon) {
  return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: color,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
}

ButtonStyle buttonStyle() {
  return ButtonStyle(
      elevation: const MaterialStatePropertyAll(0),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Global().primaryColor))));
}
