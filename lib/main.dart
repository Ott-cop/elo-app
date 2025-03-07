import 'package:elo/home/home.dart';
import 'package:elo/home/appbar/add_device/adding_device.dart';
import 'package:elo/login/login.dart';
import 'package:elo/menu/menu.dart';
import 'package:elo/outlay/outlay.dart';
import 'package:elo/profile/profile.dart';
import 'package:elo/repositories/categories_home_provider/categories_home_provider.dart';
import 'package:elo/repositories/item_home_repositories/item_home_repositories.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ItemHomeRepositories()),
      ChangeNotifierProvider(create: (_) => CategoriesHomeProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // final MqttServerClient client;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // client.subscribe('changeState', MqttQos.atMostOnce);
    return MaterialApp(
      title: 'Materion',
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
      initialRoute: "/",
      routes: {
        "/login": (_) => const LoginPage(),
        "/": (_) => const Menu(),
        "/home": (_) => const HomePage(),
        "/outlay": (_) => const OutlayPage(),
        "/profile": (_) => const ProfilePage(),
        "/home-add_device": (_) => const AddDevicePage()
      },
    );
  }
}
