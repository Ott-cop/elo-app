import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class IconUser extends StatefulWidget {
  const IconUser({super.key});

  @override
  State<IconUser> createState() => _IconUserState();
}

class _IconUserState extends State<IconUser> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(
              color: Global().primaryColor,
              width: 6,
            ),
            borderRadius: BorderRadius.circular(100)),
        child: Icon(
          Icons.person_outline,
          size: 100,
          color: Global().primaryColor,
        ),
      ),
    );
  }
}
