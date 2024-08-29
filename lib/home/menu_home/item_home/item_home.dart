import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/home/menu_home/item_home/item_settings/item_settings.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ItemHome extends StatefulWidget {
  final Device device;
  const ItemHome({super.key, required this.device});

  @override
  State<ItemHome> createState() => _ItemHomeState();
}

class _ItemHomeState extends State<ItemHome> {
  WidgetStatePropertyAll<Color> color =
      WidgetStatePropertyAll(Global().primaryColor);
  Color iconColor = Global().primaryColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.device.state!) {
      color = WidgetStatePropertyAll(Global().backgroundColor);
      iconColor = Global().primaryColor;
    } else {
      color = const WidgetStatePropertyAll(Colors.white);
      iconColor = Colors.white;
    }
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Global().primaryColor)),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ItemSettings(
                                device: widget.device,
                              )))
                },
                icon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.device.icon!.icon,
                    color: iconColor,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.device.name!,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Switch(
                      thumbColor: color,
                      value: widget.device.state!,
                      onChanged: (value) {
                        setState(() {
                          if (value) {
                            color = WidgetStatePropertyAll(
                                Global().backgroundColor);
                          } else {
                            color = const WidgetStatePropertyAll(Colors.white);
                          }
                          widget.device.state = !widget.device.state!;
                        });
                      }),
                ]),
          ),
        ],
      ),
    );
  }
}
