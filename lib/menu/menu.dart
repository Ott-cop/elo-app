import 'package:elo/home/home.dart';
import 'package:elo/outlay/outlay.dart';
import 'package:elo/profile/profile.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  double iconSize = 30;
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: setCurrentPage,
        controller: pageController,
        children: const [HomePage(), OutlayPage(), ProfilePage()],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              backgroundColor: Global().backgroundColor2,
              selectedItemColor: Global().primaryColor,
              currentIndex: currentPage,
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
              onTap: (page) => {
                pageController.animateToPage(
                  page,
                  duration: const Duration(microseconds: 3000),
                  curve: Curves.easeIn,
                )
              },
            ),
          ),
        ),
      ),
    );
  }
}
