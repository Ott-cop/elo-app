import 'package:elo/outlay/energy_used/style/style.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ConfigureValuePage extends StatefulWidget {
  const ConfigureValuePage({super.key});

  @override
  State<ConfigureValuePage> createState() => _ConfigureValuePageState();
}

class _ConfigureValuePageState extends State<ConfigureValuePage> {
  final TextEditingController _controller = TextEditingController();
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
                    child: returnPage(context: context)),
                titleInPages(
                    title: 'Editar Custo ', subtitle: 'kWh', subtitleSize: 14),
              ],
            ),
            const SizedBox(
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
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _controller,
              onChanged: (v) {
                setState(() {
                  print(v);
                });
              },
              decoration:
                  inputDecorationStyle('Ex: 1.4 kWh', const Icon(Icons.bolt)),
              keyboardType: TextInputType.number,
            )
          ],
        ),
      ),
    );
  }
}
