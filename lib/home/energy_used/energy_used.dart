import 'package:elo/styles/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EnergyUsedWidget extends StatefulWidget {
  const EnergyUsedWidget({super.key});

  @override
  State<EnergyUsedWidget> createState() => _EnergyUsedWidgetState();
}

class _EnergyUsedWidgetState extends State<EnergyUsedWidget> {
  double fontSize = 20;
  double iconSize = 40;
  bool isVisible = true;
  MainAxisAlignment alignment = MainAxisAlignment.spaceAround;

  @override
  Widget build(BuildContext context) {
    double mqw = MediaQuery.sizeOf(context).width;
    print(mqw);
    if (mqw > 370) {
      alignment = MainAxisAlignment.spaceAround;
      isVisible = true;
      fontSize = 20;
      iconSize = 40;
    } else if (mqw > 320) {
      isVisible = true;
      fontSize = 15;
      iconSize = 30;
    } else if (mqw > 300) {
      alignment = MainAxisAlignment.center;
      isVisible = false;
      fontSize = 25;
      iconSize = 40;
    }
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
        mainAxisAlignment: alignment,
        children: [
          Visibility(visible: isVisible, child: const Text('Energia Usada:')),
          Visibility(
            visible: isVisible,
            child: const VerticalDivider(
              color: Color.fromARGB(125, 255, 255, 255),
              width: 20,
              indent: 20,
              endIndent: 20,
            ),
          ),
          TextButton.icon(
              onPressed: () => {},
              icon: Icon(
                Icons.energy_savings_leaf,
                size: iconSize,
              ),
              style: const ButtonStyle(
                  iconSize: WidgetStatePropertyAll(40),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
              label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Este Mês'),
                  Text(
                    '0,84 kWh',
                    style: TextStyle(color: Colors.white, fontSize: fontSize),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
