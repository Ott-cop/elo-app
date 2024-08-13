import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/repositories/item_home_repositories/item_home_repositories.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/v4.dart';

class AddingDeviceController {
  Icon? _icon;
  String? _deviceName;
  int? _port;

  String? validateIcon(Icon? icon) {
    _icon = icon;
    if (icon == null) {
      return 'Obrigatório';
    }
    return null;
  }

  String? validateDeviceName(String? deviceName) {
    _deviceName = deviceName;
    if (deviceName == null || deviceName.isEmpty) {
      return 'Obrigatório';
    } else if (deviceName.length < 3 || deviceName.length > 12) {
      return 'Entre 3 a 12 caracteres!';
    }
    return null;
  }

  String? validatePort(int? port) {
    _port = port;
    if (port == null) {
      return 'Obrigatório';
    }
    return null;
  }

  void validateForm(BuildContext context, bool validate) {
    if (validate) {
      Provider.of<ItemHomeRepositories>(context, listen: false).add(Device(
          id: const UuidV4(),
          icon: _icon!,
          name: _deviceName!,
          port: _port!,
          state: false));
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBarStyle("Criado com sucesso!", Colors.green));
    }
  }
}
