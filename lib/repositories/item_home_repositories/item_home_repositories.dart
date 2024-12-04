import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';
import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_buffers.dart';

class ItemHomeRepositories extends ChangeNotifier {
  MqttServerClient _client = MqttServerClient("192.168.0.100", "");
  final List<Device> _listItems = [];

  UnmodifiableListView<Device> get listItems =>
      UnmodifiableListView(_listItems);

  changeState(String id, bool newState) async {
    var index = _listItems.indexWhere((listItem) => listItem.id == id);

    _listItems[index].state = newState;
    final Map<String, dynamic> jsonData = {
      'id': 1,
      'pin': 23,
      'state': newState
    };

    String jsonString = jsonEncode(jsonData);

    // 2. Converter a string JSON em bytes (Uint8List)
    Uint8List dataBytes = Uint8List.fromList(utf8.encode(jsonString));
    Uint8Buffer dataBuffer = Uint8Buffer();
    dataBuffer.addAll(dataBytes);
    _client.publishMessage("changeState", MqttQos.atMostOnce, dataBuffer);
    notifyListeners();
  }

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

  ItemHomeRepositories() {
    _client.clientIdentifier = "user";
    _client.secure = false;
    _client.port = 1883;
    _client.connect("user", "12342234");
  }
}
