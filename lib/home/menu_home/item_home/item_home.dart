import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemHome extends StatefulWidget {
  late Device device;
  ItemHome({super.key, required this.device});

  @override
  State<ItemHome> createState() => _ItemHomeState();
}

class _ItemHomeState extends State<ItemHome> {
  WidgetStatePropertyAll<Color> color =
      WidgetStatePropertyAll(Global().primaryColor);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.device.state) {
      color = WidgetStatePropertyAll(Global().backgroundColor);
    } else {
      color = const WidgetStatePropertyAll(Colors.white);
    }
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Global().primaryColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.device.icon,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(widget.device.name),
          const SizedBox(
            height: 5,
          ),
          Switch(
              thumbColor: color,
              value: widget.device.state,
              onChanged: (value) {
                setState(() {
                  if (value) {
                    color = WidgetStatePropertyAll(Global().backgroundColor);
                  } else {
                    color = const WidgetStatePropertyAll(Colors.white);
                  }
                  widget.device.state = !widget.device.state;
                });
              }),
        ],
      ),
    );
  }
}
