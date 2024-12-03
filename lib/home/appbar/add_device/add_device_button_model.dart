import 'package:elo/home/appbar/add_device/adding_device.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class AddDeviceButtonModel extends StatefulWidget {
  const AddDeviceButtonModel({super.key});

  @override
  State<AddDeviceButtonModel> createState() => _AddDeviceButtonState();
}

class _AddDeviceButtonState extends State<AddDeviceButtonModel> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Global().primaryColor.withOpacity(0.2),
      splashFactory: InkSparkle.splashFactory,
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddDevicePage()))
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Global().primaryColor)),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
