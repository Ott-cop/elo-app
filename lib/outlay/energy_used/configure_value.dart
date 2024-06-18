import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ConfigureValuePage extends StatelessWidget {
  const ConfigureValuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: safeAreaModified(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
                Text.rich(
                  TextSpan(children: [
                    const TextSpan(text: 'Editar Custo '),
                    TextSpan(
                        text: 'kWh',
                        style: TextStyle(
                            color: Global().primaryColor, fontSize: 14))
                  ]),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text.rich(
              TextSpan(children: [
                const TextSpan(
                    text:
                        'Para configurar o custo da Economia, primeiro informe o valor do '),
                TextSpan(
                    text: 'kWh',
                    style: TextStyle(
                        color: Global().primaryColor,
                        fontWeight: FontWeight.bold)),
                const TextSpan(
                  text: ' da sua residência.\n\n',
                ),
                const TextSpan(
                    text:
                        'Link Auxiliar: https://www.portalsolar.com.br/como-calcular-o-consumo-de-energia-em-kwh\n\n'),
                const TextSpan(text: 'Por exemplo:'),
              ]),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Global().primaryColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: '1 kWh',
                        style: TextStyle(
                            color: Global().primaryColor,
                            fontWeight: FontWeight.bold)),
                    const TextSpan(
                      text: ' = R\$ 0,84',
                    )
                  ], style: const TextStyle(fontSize: 22)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
