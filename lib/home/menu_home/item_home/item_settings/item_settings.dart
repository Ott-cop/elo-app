import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/home/menu_home/item_home/item_settings/item_settings_controller.dart';
import 'package:elo/outlay/energy_used/style/style.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ItemSettings extends StatefulWidget {
  const ItemSettings({super.key, required this.device});
  final Device device;

  @override
  State<ItemSettings> createState() => _ItemSettingsState();
}

class _ItemSettingsState extends State<ItemSettings> {
  final _form = ItemSettingsController();
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
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
            titleInPages(title: 'Configurar ', subtitle: 'Dispositivo')
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
                      "Para configurar um dispositivo, digite o que deseja alterar e clique em "),
              TextSpan(
                  text: "Alterar.",
                  style: TextStyle(color: Global().primaryColor)),
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
                    onChanged: (icon) => {_form.setIcon = icon},
                    hint: widget.device.icon,
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
                  validator: _form.setDeviceName,
                  controller: _controller,
                  decoration: inputDecorationStyle(widget.device.name, null),
                ),
              ),
              Container(
                  width: 120,
                  padding: const EdgeInsets.only(left: 4),
                  child: DropdownButtonFormField(
                    onChanged: (port) => {_form.setPort = port},
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
                    hint: Text("${widget.device.port}"),
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
        ElevatedButton(
            onPressed: () {
              _form.setDevice(
                  context, _formKey.currentState!.validate(), widget.device.id);
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
                  "Alterar",
                  style: TextStyle(
                      color: Global().backgroundColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ))
      ],
    )));
  }
}
