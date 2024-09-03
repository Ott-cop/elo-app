import 'dart:ui';

import 'package:elo/home/home.dart';
import 'package:elo/outlay/outlay.dart';
import 'package:elo/profile/profile.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatefulWidget {
  static int currentPage = 0;

  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late PageController _pageController;
  int _index = 0;
  double iconSize = 30;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _goToPage(int index) {
    setState(() {
      _index = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastEaseInToSlowEaseOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _index = value;
            });
          },
          children: const [
            HomePage(),
            OutlayPage(),
            ProfilePage(),
          ],
        ),
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
                    backgroundColor: Global().backgroundColor.withOpacity(0.5),
                    selectedItemColor: Global().primaryColor,
                    onTap: _goToPage,
                    currentIndex: _index,
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
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
