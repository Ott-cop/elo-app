import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/repositories/item_home_repositories/item_home_repositories.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/v4.dart';

class ItemSettingsController {
  Icon? _icon;
  String? _deviceName;
  int? _port;

  set setIcon(Icon? icon) {
    if (icon != null) {
      _icon = icon;
    }
  }

  String? setDeviceName(String? deviceName) {
    if (deviceName != null) {
      if (deviceName.isNotEmpty) {
        if (deviceName.length < 3 || deviceName.length > 12) {
          return 'Entre 3 a 12 caracteres!';
        }
        _deviceName = deviceName;
      }
    }
    return null;
  }

  set setPort(int? port) {
    if (port != null) {
      _port = port;
    }
  }

  void setDevice(BuildContext context, bool validate, UuidV4 deviceId) {
    if (validate) {
      Provider.of<ItemHomeRepositories>(context, listen: false).edit(
          Device(id: deviceId, icon: _icon, name: _deviceName, port: _port));
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBarStyle("Editado com sucesso!", Colors.green));
    }
  }
}
