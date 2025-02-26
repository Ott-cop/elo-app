import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/home/menu_home/item_home/item_settings/item_settings.dart';
import 'package:elo/repositories/item_home_repositories/item_home_repositories.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var device = Provider.of<ItemHomeRepositories>(context);
    if (widget.device.state!) {
      color = WidgetStatePropertyAll(Global().backgroundColor);
      iconColor = Global().primaryColor;
    } else {
      color = const WidgetStatePropertyAll(Colors.white);
      iconColor = Colors.white;
    }
    return InkWell(
      splashFactory: InkSparkle.splashFactory,
      splashColor: Global().splashPrimaryColor,
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ItemSettings(
                    device: widget.device,
                  ))),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Global().primaryColor)),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(4.0),
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
                      size: 30,
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
                    SizedBox(
                      width: 42,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                            thumbColor: color,
                            value: widget.device.state!,
                            onChanged: (value) {
                              setState(() {
                                if (value) {
                                  color = WidgetStatePropertyAll(
                                      Global().backgroundColor);
                                  device.changeState(widget.device.id, true,
                                      widget.device.topic!);
                                } else {
                                  color = const WidgetStatePropertyAll(
                                      Colors.white);
                                  device.changeState(widget.device.id, false,
                                      widget.device.topic!);
                                }
                                // widget.device.state = !widget.device.state!;
                              });
                            }),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
