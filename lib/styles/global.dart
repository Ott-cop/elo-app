import 'package:flutter/material.dart';

class Global {
  Color primaryColor = const Color(0xFFD86506);
  Color backgroundColor = const Color(0xFF030D13);
  Color backgroundColor2 = const Color(0xFF05151F);
}

SafeArea safeAreaModified({required Widget child}) {
  return SafeArea(
    top: true,
    minimum: const EdgeInsets.only(top: 40, left: 20, right: 20),
    child: child,
  );
}

SnackBar snackBarStyle(String? message, Color? color) {
  return SnackBar(
    content: Text('$message'),
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
