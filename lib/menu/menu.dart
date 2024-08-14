import 'dart:ui';

import 'package:elo/home/home.dart';
import 'package:elo/outlay/outlay.dart';
import 'package:elo/profile/profile.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  static int currentPage = 0;

  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double iconSize = 30;

  void _toPage(int page) {
    setState(() {
      Menu.currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(builder: (context) {
          if (Menu.currentPage == 0) {
            return const HomePage();
          } else if (Menu.currentPage == 1) {
            return const OutlayPage();
          } else if (Menu.currentPage == 2) {
            return const ProfilePage();
          }
          return Container();
        }),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 50, right: 50),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 2,
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: BottomNavigationBar(
                      backgroundColor:
                          Global().backgroundColor.withOpacity(0.5),
                      selectedItemColor: Global().primaryColor,
                      currentIndex: Menu.currentPage,
                      elevation: 0,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home_rounded,
                              size: iconSize,
                            ),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.energy_savings_leaf_rounded,
                              size: iconSize,
                            ),
                            label: 'Gastos'),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.person,
                              size: iconSize,
                            ),
                            label: 'Perfil')
                      ],
                      onTap: _toPage),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
