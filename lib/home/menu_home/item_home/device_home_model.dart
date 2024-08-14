import 'package:flutter/material.dart';

class Device {
  String id;
  Icon? icon;
  String? name;
  int? port;
  bool? state;

  Device(
      {required this.id,
      required this.icon,
      required this.name,
      required this.port,
      this.state});
}
