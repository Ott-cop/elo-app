import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class EnergyUsedWidget extends StatefulWidget {
  const EnergyUsedWidget({super.key});

  @override
  State<EnergyUsedWidget> createState() => _EnergyUsedWidgetState();
}

class _EnergyUsedWidgetState extends State<EnergyUsedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Global().primaryColor,
                Global().backgroundColor2,
                Global().backgroundColor2,
                Global().backgroundColor2,
                Global().primaryColor
              ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Energia Usada:'),
          const VerticalDivider(
            color: Color.fromARGB(125, 255, 255, 255),
            width: 20,
            indent: 20,
            endIndent: 20,
          ),
          TextButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.energy_savings_leaf),
              style: const ButtonStyle(
                  iconSize: MaterialStatePropertyAll(40),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
              label: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Este Mês'),
                  Text(
                    '0,84 kWh',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
