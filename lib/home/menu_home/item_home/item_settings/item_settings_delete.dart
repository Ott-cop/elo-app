import 'package:elo/home/menu_home/item_home/item_settings/item_settings_controller.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ItemSettingsDelete extends StatefulWidget {
  final String deviceId;

  const ItemSettingsDelete({super.key, required this.deviceId});

  @override
  State<ItemSettingsDelete> createState() => _ItemSettingsDeleteState();
}

class _ItemSettingsDeleteState extends State<ItemSettingsDelete> {
  final _form = ItemSettingsController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buttonDefault(
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            overlayColor: Colors.red.shade300,
            onPressed: () async {
              _form.deleteDevice(context, widget.deviceId);
              Navigator.of(context).pop();
            },
            text: "Deletar Dispositivo",
            textColor: Colors.white)
      ],
    );
  }
}
