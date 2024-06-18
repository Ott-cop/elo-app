import 'package:elo/outlay/energy_used/configure_value.dart';
import 'package:elo/outlay/energy_used/energy_used.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class OutlayPage extends StatelessWidget {
  const OutlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global().backgroundColor,
      body: safeAreaModified(
        child: Column(
          children: [
            const EnergyUsedPageWidget(
              icon: Icons.attach_money,
              iconModal: Icons.settings,
              color: Colors.green,
              typeDate: 'Economizou',
              energyUsed: 'R\$ 103,50',
              toScreen: ConfigureValuePage(),
            ),
            const SizedBox(
              height: 15,
            ),
            EnergyUsedPageWidget(
              icon: Icons.shower,
              iconModal: Icons.info,
              color: Colors.red.shade900,
              typeDate: 'Maior Gasto',
              energyUsed: 'Ar condicionado',
              toScreen: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
