import 'package:elo/outlay/energy_used/style/style.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class SelectIcon extends StatelessWidget {
  const SelectIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Icon>(
      onChanged: (icon) => {},
      hint: const Icon(Icons.image),
      items: <Icon>[
        const Icon(Icons.lightbulb),
        const Icon(Icons.laptop_chromebook),
        const Icon(Icons.bathtub_sharp),
        const Icon(Icons.garage),
        const Icon(Icons.shower),
        const Icon(Icons.light),
        const Icon(Icons.light_mode_rounded),
        const Icon(Icons.wb_incandescent),
        const Icon(Icons.tv)
      ].map((Icon icon) {
        return DropdownMenuItem(
          alignment: Alignment.center,
          value: icon,
          child: icon,
        );
      }).toList(),
      dropdownColor: Global().backgroundColor2,
      decoration: inputDecorationStyle(null, null),
      isExpanded: true,
    );
  }
}
