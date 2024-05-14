import 'package:elo/home/home.dart';
import 'package:elo/login/login.dart';
import 'package:elo/menu/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        fontFamily: 'Orbitron',
        colorScheme: const ColorScheme.dark(
            primary: Color.fromARGB(255, 216, 101, 6),
            background: Color(0xFF030D13),
            error: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: "/menu",
      routes: {
        "/menu": (_) => const Menu(),
        "/": (_) => const HomePage(),
        "/login": (_) => const LoginPage(),
      },
    );
  }
}
