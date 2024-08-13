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
        onPressed: () => Navigator.of(context).pushNamed("/home-add_device"),
        style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(Size(10, 10)),
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        icon: Icon(
          Icons.add,
          applyTextScaling: true,
          color: Global().backgroundColor,
          size: 22,
        ));
  }
}
