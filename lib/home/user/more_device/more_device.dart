import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class MoreDeviceWidget extends StatefulWidget {
  const MoreDeviceWidget({super.key});

  @override
  State<MoreDeviceWidget> createState() => _MoreDeviceWidgetState();
}

class _MoreDeviceWidgetState extends State<MoreDeviceWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {},
        style: ButtonStyle(
            minimumSize: const MaterialStatePropertyAll(Size(10, 10)),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        icon: Icon(
          Icons.add,
          color: Global().backgroundColor,
          size: 20,
        ));
  }
}
