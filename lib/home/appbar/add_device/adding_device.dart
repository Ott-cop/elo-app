import 'package:elo/home/appbar/add_device/adding_device_controller.dart';
import 'package:elo/outlay/energy_used/style/style.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({super.key});

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final _form = AddingDeviceController();
  final _formKey = GlobalKey<FormState>();

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
        Form(
          key: _formKey,
          child: Row(
            children: [
              Container(
                  width: 75,
                  padding: const EdgeInsets.only(right: 4),
                  child: DropdownButtonFormField<Icon>(
                    validator: (icon) => _form.validateIcon(icon),
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
                  )),
              Expanded(
                child: TextFormField(
                  validator: (deviceName) =>
                      _form.validateDeviceName(deviceName),
                  decoration: inputDecorationStyle("Nome", null),
                ),
              ),
              Container(
                  width: 120,
                  padding: const EdgeInsets.only(left: 4),
                  child: DropdownButtonFormField(
                    validator: (port) => _form.validatePort(port),
                    onChanged: (value) => {},
                    items: <int>[
                      1,
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                      8,
                      9,
                      10,
                      11,
                      12,
                      13,
                      14,
                      15
                    ].map((int n) {
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
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buttonDefault(
            backgroundColor: Global().primaryColor,
            overlayColor: Global().splashPrimaryColor,
            onPressed: () =>
                _form.validateForm(context, _formKey.currentState!.validate()),
            icon: Icon(
              Icons.check,
              color: Global().backgroundColor,
            ),
            text: 'Criar',
            textColor: Global().backgroundColor),
      ],
    )));
  }
}
// _form.validateForm(context, _formKey.currentState!.validate());