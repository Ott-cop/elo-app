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
    } else {
      emailState = Colors.white;
    }
    notifyListeners();
  }

  onFocusChangePassword() {
    if (focusPassword.hasFocus) {
      passwordState = Global().primaryColor;
    } else {
      passwordState = Colors.white;
    }
    notifyListeners();
  }
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(
    colors: [Global().backgroundColor, Global().primaryColor],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  ));
}

// InputDecoration inputDecorationStyle(String label, Color color, IconData icon) {
//   return InputDecoration(
//       labelText: label,
//       prefixIcon: Icon(
//         icon,
//         color: color,
//       ),
//       floatingLabelStyle: TextStyle(color: Global().primaryColor),
//       focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Global().primaryColor)),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
// }

ButtonStyle buttonStyle() {
  return ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Global().primaryColor))));
}
