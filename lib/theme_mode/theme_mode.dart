import 'package:flutter/material.dart';

class ThemeModePage extends StatefulWidget {
  const ThemeModePage({super.key});

  @override
  State<ThemeModePage> createState() => _ThemeModePageState();
}

class _ThemeModePageState extends State<ThemeModePage> {
  @override
  Widget build(BuildContext context) {
    final size =
        (MediaQuery.of(context).size.height - (kBottomNavigationBarHeight)) *
            0.5;
    return Scaffold(
        body: ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size,
                width: MediaQuery.of(context).size.width,
                child: IconButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(LinearBorder.none)),
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.light_mode,
                      size: 60,
                    )),
              ),
              SizedBox(
                height: size,
                width: MediaQuery.of(context).size.width,
                child: IconButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(LinearBorder.none)),
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.dark_mode,
                      size: 60,
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
