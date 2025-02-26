import 'package:flutter/material.dart';

class Device {
  String id;
  String? categoryId;
  Icon? icon;
  String? name;
  String? topic;
  bool? state;

  Device(
      {required this.id,
      this.categoryId,
      required this.icon,
      required this.name,
      required this.topic,
      this.state});
}
