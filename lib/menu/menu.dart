import 'package:elo/home/home.dart';
import 'package:elo/outlay/outlay.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
        children: const [HomePage(), OutlayPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Global().backgroundColor,
        selectedItemColor: Global().primaryColor,
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.energy_savings_leaf_rounded), label: 'Gastos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
        ],
        onTap: (page) => {
          pageController.animateToPage(page,
              duration: const Duration(microseconds: 3000),
              curve: Curves.easeIn)
        },
      ),
    );
  }
}
