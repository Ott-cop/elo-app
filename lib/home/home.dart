import 'package:elo/home/energy_used/energy_used.dart';
import 'package:elo/home/menu_home/menu_home.dart';
import 'package:elo/home/appbar/appbar.dart';
import 'package:elo/styles/global.dart';
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
    return Scaffold(
      backgroundColor: Global().backgroundColor,
      body: safeAreaModified(
        child: const Column(
          children: [
            AppBarHome(),
            SizedBox(
              height: 15,
            ),
            EnergyUsedWidget(),
            SizedBox(
              height: 15,
            ),
            Expanded(child: MenuHomeWidget()),
          ],
        ),
      ),
    );
  }
}
