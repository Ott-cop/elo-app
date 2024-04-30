import 'package:flutter/material.dart';

class Global {
  Color primaryColor = const Color(0xFFD86506);
  Color backgroundColor = const Color(0xFF030D13);
}

SnackBar snackBarStyle(String? message, Color? color) {
  return SnackBar(
    content: Text('$message'),
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
