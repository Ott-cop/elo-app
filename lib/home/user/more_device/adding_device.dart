import 'package:elo/home/user/more_device/select_icon.dart';
import 'package:elo/home/user/more_device/select_port.dart';
import 'package:elo/outlay/energy_used/style/style.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class AddingDevice extends StatefulWidget {
  const AddingDevice({super.key});

  @override
  State<AddingDevice> createState() => _AddingDeviceState();
}

class _AddingDeviceState extends State<AddingDevice> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.sizeOf(context).width;
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
            titleInPages(title: 'Adicionar ', subtitle: 'Dispositivo')
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                  text:
                      "Para adicionar um dispositivo, primeiramente digite o "),
              TextSpan(
                  text: "nome", style: TextStyle(color: Global().primaryColor)),
              const TextSpan(text: ", selecione um "),
              TextSpan(
                  text: "ícone",
                  style: TextStyle(color: Global().primaryColor)),
              const TextSpan(text: ", e então coloque uma "),
              TextSpan(
                  text: "porta ",
                  style: TextStyle(color: Global().primaryColor)),
              const TextSpan(text: "de energia."),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Container(
                width: 75,
                padding: const EdgeInsets.only(right: 4),
                child: const SelectIcon()),
            Expanded(
              child: TextFormField(
                controller: _controller,
                decoration: inputDecorationStyle("Nome", null),
              ),
            ),
            Container(
                width: 120,
                padding: const EdgeInsets.only(left: 4),
                child: const SelectPort())
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              print("Clicado");
            },
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                overlayColor:
                    WidgetStatePropertyAll(Global().splashPrimaryColor),
                backgroundColor: WidgetStatePropertyAll(Global().primaryColor),
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Global().primaryColor)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: Global().backgroundColor,
                ),
                Text(
                  "Criar",
                  style: TextStyle(color: Global().backgroundColor),
                ),
              ],
            ))
      ],
    )));
  }
}
