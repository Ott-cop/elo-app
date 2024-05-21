import 'package:elo/home/energy_used/energy_used.dart';
import 'package:elo/home/menu_home/menu_home.dart';
import 'package:elo/home/user/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: true,
        minimum: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            UserWidget(),
            SizedBox(
              height: 15,
            ),
            EnergyUsedWidget(),
            SizedBox(
              height: 15,
            ),
            Expanded(flex: 3, child: MenuHomeWidget()),
            // SizedBox(
            //   height: 100,
            // )
          ],
        ),
      ),
    );
  }
}
