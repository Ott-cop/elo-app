import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/repositories/item_home_repositories/item_home_repositories.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void setDevice(BuildContext context, bool validate, String deviceId) {
    if (validate) {
      Provider.of<ItemHomeRepositories>(context, listen: false).edit(
          Device(id: deviceId, icon: _icon, name: _deviceName, port: _port));

      toast(
              message: "Editado com sucesso!",
              color: Colors.green,
              icon: const Icon(Icons.check))
          .show(context);
    }
  }

  void deleteDevice(BuildContext context, String deviceId) {
    Provider.of<ItemHomeRepositories>(context, listen: false).delete(deviceId);

    toast(
            message: "Deletado com sucesso!",
            color: Colors.red,
            icon: const Icon(Icons.delete))
        .show(context);
  }
}
