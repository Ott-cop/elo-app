import 'package:elo/profile/widgets/iconUser.dart';
import 'package:elo/profile/widgets/userInformation.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Global().backgroundColor,
      body: safeAreaModified(
          child: const Column(children: [
        IconUser(),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: UserInformation(),
        ),
      ])),
    );
  }
}
