import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/repositories/categories_home_provider/categories_home_provider.dart';
import 'package:elo/repositories/item_home_repositories/item_home_repositories.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/v4.dart';

class AddingDeviceController {
  Icon? _icon;
  String? _deviceName;
  String? _categoryName;
  String? _topic;

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

  String? validateCategory(String? categoryName) {
    _categoryName = categoryName;
    if (categoryName == null || categoryName.isEmpty) {
      return 'Obrigatório';
    } else if (categoryName.length < 3 || categoryName.length > 12) {
      return 'Entre 3 a 12 caracteres!';
    }
    return null;
  }

  String? validateTopic(String? topic) {
    _topic = topic;
    if (topic == null) {
      return 'Obrigatório';
    }
    return null;
  }

  void validateForm(BuildContext context, bool validate) {
    if (validate) {
      var categoryList =
          Provider.of<CategoriesHomeProvider>(context, listen: false)
              .listCategory;
      debugPrint(_categoryName);
      var category =
          categoryList.indexWhere((value) => value.name == _categoryName);

      if (category <= -1) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar(
            "Não existe nenhuma categoria com esse nome!", Colors.red));
        return;
      }

      Provider.of<ItemHomeRepositories>(context, listen: false).add(
        Device(
            id: const UuidV4().generate(),
            categoryId: categoryList[category].id,
            icon: _icon!,
            name: _deviceName!,
            topic: _topic!,
            state: false),
      );
      toast(
              message: "Criado com sucesso!",
              color: Colors.green,
              icon: const Icon(Icons.check))
          .show(context);
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(snackBar("Criado com sucesso!", Colors.green));
    }
  }
}
