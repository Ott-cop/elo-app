import 'package:elo/home/menu_home/item_home/device_home_controller.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ItemHome extends StatefulWidget {
  const ItemHome({super.key});

  @override
  State<ItemHome> createState() => _ItemHomeState();
}

class _ItemHomeState extends State<ItemHome> {
  Device device = Device(
      icon: const Icon(Icons.bathtub_rounded), name: 'Banheiro', state: true);
  @override
  Widget build(BuildContext context) {
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
          device.icon,
          Text('${device.name}'),
          Switch(
              // inactiveThumbColor: Global().primaryColor,
              splashRadius: 0,
              // thumbColor: MaterialStatePropertyAll(Global().backgroundColor),
              value: device.state,
              onChanged: (_) {
                setState(() {
                  device.state = !device.state;
                });
              }),
        ],
      ),
    );
  }
}
