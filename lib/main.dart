import 'package:elo/home/home.dart';
import 'package:elo/home/user/more_device/adding_device.dart';
import 'package:elo/login/login.dart';
import 'package:elo/menu/menu.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ELO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Global().backgroundColor,
        splashFactory: InkSplash.splashFactory,
        fontFamily: 'Orbitron',
        colorScheme: const ColorScheme.dark(
            primary: Color.fromARGB(255, 216, 101, 6),
            surface: Color(0xFF030D13),
            error: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: "/menu",
      routes: {
        "/": (_) => const LoginPage(),
        "/menu": (_) => const Menu(),
        "/home": (_) => const HomePage(),
        "/home-add_device": (_) => const AddingDevice()
      },
    );
  }
}
