import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
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
    maintainBottomViewPadding: true,
    bottom: false,
    minimum: const EdgeInsets.only(top: 45, left: 20, right: 20),
    child: child,
  );
}

SnackBar snackBar(String? message, Color? color) {
  return SnackBar(
    content: Text(
      '$message',
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 1500),
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 90),
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}

DelightToastBar toast({
  required String message,
  Color? textColor,
  Color? color,
  Icon? icon,
}) {
  return DelightToastBar(
    autoDismiss: true,
    snackbarDuration: const Duration(seconds: 2),
    builder: (context) => ToastCard(
      color: color,
      leading: icon,
      title: Text(
        message,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    ),
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

ElevatedButton buttonDefault(
    {Function()? onPressed,
    Color? backgroundColor,
    Color? overlayColor,
    Color? borderColor,
    Icon? icon,
    required String text,
    Color textColor = Colors.white,
    Widget? child}) {
  borderColor ??= textColor;
  overlayColor ??= textColor.withOpacity(0.1);
  return ElevatedButton.icon(
    onPressed: onPressed,
    label: Text(
      text,
      style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
    ),
    icon: icon,
    style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
        elevation: const WidgetStatePropertyAll(0),
        overlayColor: WidgetStatePropertyAll(overlayColor),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: borderColor)))),
  );
}

// TextStyle(color: textColor, fontWeight: FontWeight.bold),
InputDecoration inputDecorationStyle(
    {String? hint,
    Text? label,
    Icon? icon,
    Color? color,
    FloatingLabelBehavior? floatingLabel}) {
  color ??= Global().primaryColor;
  return InputDecoration(
      label: label,
      hintText: hint,
      prefixIcon: icon,
      floatingLabelBehavior: floatingLabel,
      hoverColor: Colors.red,
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10)),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ));
}
