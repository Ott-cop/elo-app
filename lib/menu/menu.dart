import 'package:elo/home/home.dart';
import 'package:elo/styles/global.dart';
import 'package:elo/theme_mode/theme_mode.dart';
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
        children: const [HomePage(), ThemeModePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Global().primaryColor,
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.light_mode_rounded), label: 'Modo'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
        ],
        onTap: (page) => {
          pageController.animateToPage(page,
              duration: const Duration(microseconds: 3000), curve: Curves.ease)
        },
      ),
    );
  }
}
