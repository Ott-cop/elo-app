import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class EnergyUsedPageWidget extends StatefulWidget {
  final IconData icon;
  final Icon? iconModal;
  final Color color;
  final String typeDate;
  final String energyUsed;
  final Widget toScreen;
  const EnergyUsedPageWidget({
    super.key,
    required this.icon,
    this.iconModal,
    required this.color,
    required this.typeDate,
    required this.energyUsed,
    required this.toScreen,
  });

  @override
  State<EnergyUsedPageWidget> createState() => _EnergyUsedPageWidgetState();
}

class _EnergyUsedPageWidgetState extends State<EnergyUsedPageWidget> {
  double fontSize = 20;
  double iconSize = 40;
  bool isVisible = true;
  MainAxisAlignment alignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    double mqw = MediaQuery.sizeOf(context).width;
    // debugPrint(mqw.toString());
    if (mqw > 370) {
      isVisible = true;
      fontSize = 20;
      iconSize = 60;
    } else if (mqw > 320) {
      isVisible = true;
      fontSize = 15;
      iconSize = 50;
    } else if (mqw > 300) {
      isVisible = false;
      fontSize = 15;
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
                widget.color,
                Global().backgroundColor,
                Global().backgroundColor,
                widget.color
              ])),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Visibility(
            visible: isVisible,
            child: Icon(
              widget.icon,
              size: iconSize,
            ),
          ),
          Visibility(
            visible: isVisible,
            child: const VerticalDivider(
              color: Color.fromARGB(125, 255, 255, 255),
              indent: 25,
              endIndent: 25,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.typeDate,
                  style: TextStyle(
                      color: widget.color, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.energyUsed,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Builder(builder: (context) {
              if (widget.iconModal != null) {
                return IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => widget.toScreen));
                  },
                  icon: Icon(
                    widget.iconModal!.icon,
                    size: 30,
                  ),
                );
              } else {
                return Container();
              }
            }),
          )
        ],
      ),
    );
  }
}
