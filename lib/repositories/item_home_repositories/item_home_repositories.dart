import 'dart:collection';
import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:flutter/material.dart';

class ItemHomeRepositories extends ChangeNotifier {
  final List<Device> _listItems = [];

  UnmodifiableListView get listItems => UnmodifiableListView(_listItems);

  add(Device item) {
    _listItems.add(item);
    notifyListeners();
  }

  edit(Device item) {
    var index = _listItems.indexWhere(
      (listItem) => item.id == listItem.id,
    );
    if (item.icon != null) {
      _listItems[index].icon = item.icon;
    }
    if (item.name != null) {
      _listItems[index].name = item.name;
    }
    if (item.port != null) {
      _listItems[index].port = item.port;
    }
    notifyListeners();
  }

  delete(String deviceId) {
    _listItems.removeWhere((listItem) => listItem.id == deviceId);
    notifyListeners();
  }
}
