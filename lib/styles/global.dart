import 'package:flutter/material.dart';

class Global {
  Color primaryColor = const Color(0xFFD86506);
  Color splashPrimaryColor = const Color.fromARGB(255, 250, 156, 79);
  Color backgroundColor = const Color(0xFF030D13);
  Color backgroundColor2 = const Color.fromARGB(255, 5, 20, 29);
}

SafeArea safeAreaModified({required Widget child}) {
  return SafeArea(
    top: true,
    bottom: false,
    minimum: const EdgeInsets.only(top: 65, left: 20, right: 20),
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

Text titleInPages(
    {required String title, String? subtitle, double? subtitleSize}) {
  subtitleSize ??= 18;
  return Text.rich(
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    TextSpan(children: [
      TextSpan(text: title),
      TextSpan(
          text: subtitle,
          style:
              TextStyle(color: Global().primaryColor, fontSize: subtitleSize))
    ]),
  );
}

IconButton returnPage({required BuildContext context}) {
  return IconButton(
      onPressed: () => Navigator.pop(context, true),
      icon: const Icon(Icons.arrow_back_ios_new_rounded));
}
