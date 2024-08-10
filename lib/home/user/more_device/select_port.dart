import 'package:elo/outlay/energy_used/style/style.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class SelectPort extends StatelessWidget {
  const SelectPort({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged: (value) => {},
      items:
          <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].map((int n) {
        return DropdownMenuItem(
          alignment: Alignment.center,
          value: n,
          child: Text("$n"),
        );
      }).toList(),
      hint: const Text("Porta"),
      dropdownColor: Global().backgroundColor2,
      decoration: inputDecorationStyle(null, null),
      isExpanded: true,
    );
  }
}
