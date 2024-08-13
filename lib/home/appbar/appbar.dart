import 'package:elo/home/appbar/add_device/add_device_button.dart';
import 'package:elo/home/appbar/notifications/notifications.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(
            Icons.person,
            size: 35,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seja bem vindo',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Text(
              'Bartholomeu S.',
              style: TextStyle(
                  color: Global().primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            NotificationsWidget(),
            MoreDeviceWidget(),
          ],
        ))
      ],
    ));
  }
}
