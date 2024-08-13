import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

class Device {
  UuidV4 id;
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
