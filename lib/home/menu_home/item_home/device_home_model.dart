import 'package:flutter/material.dart';

class Device {
  String id;
  String? categoryId;
  Icon? icon;
  String? name;
  int? port;
  bool? state;

  Device(
      {required this.id,
      this.categoryId,
      required this.icon,
      required this.name,
      required this.port,
      this.state});
}
