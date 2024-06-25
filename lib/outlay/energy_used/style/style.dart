import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecorationStyle(String hint, Color color, IconData icon) {
  return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: color,
      ),
      // floatingLabelStyle: TextStyle(color: Global().primaryColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Global().primaryColor)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
}
