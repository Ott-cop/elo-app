import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecorationStyle(
  String? hint,
  Icon? icon,
) {
  return InputDecoration(
      hintText: hint,
      prefixIcon: icon,

      // floatingLabelStyle: TextStyle(color: Global().primaryColor),

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global().primaryColor)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
}
