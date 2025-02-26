import 'package:elo/home/appbar/add_device/adding_device_controller.dart';
import 'package:elo/home/appbar/add_device/create_category.dart';
import 'package:elo/home/menu_home/item_home/category_home_model.dart';
import 'package:elo/repositories/categories_home_provider/categories_home_provider.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({super.key});

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final _form = AddingDeviceController();
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final category =
        Provider.of<CategoriesHomeProvider>(context).listCategory.toList();
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: safeAreaModified(
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
                      text: "nome",
                      style: TextStyle(color: Global().primaryColor)),
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
              child: Column(
                children: [
                  Row(
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
                            borderRadius: BorderRadius.circular(10),
                            focusColor: Global().backgroundColor,
                            decoration: inputDecorationStyle(),
                            isExpanded: true,
                          )),
                      Expanded(
                        child: TextFormField(
                          validator: (deviceName) =>
                              _form.validateDeviceName(deviceName),
                          decoration: inputDecorationStyle(hint: "Nome"),
                        ),
                      ),
                      Container(
                          width: 120,
                          padding: const EdgeInsets.only(left: 4),
                          child: DropdownButtonFormField(
                            validator: (port) => _form.validateTopic(port),
                            onChanged: (value) => {},
                            items: <String>["pin_2", "pin_23"].map((String n) {
                              return DropdownMenuItem(
                                alignment: Alignment.center,
                                value: n,
                                child: Text(n),
                              );
                            }).toList(),
                            hint: const Text("Tópico"),
                            dropdownColor: Global().backgroundColor2,
                            borderRadius: BorderRadius.circular(10),
                            focusColor: Global().backgroundColor,
                            decoration: inputDecorationStyle(),
                            isExpanded: true,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 200,
                      child: DropdownButtonFormField(
                          validator: (value) =>
                              _form.validateCategory(value!.name),
                          borderRadius: BorderRadius.circular(10),
                          focusColor: Global().backgroundColor,
                          dropdownColor: Global().backgroundColor2,
                          decoration: inputDecorationStyle(),
                          value: category[0],
                          items: category.map<DropdownMenuItem<Category>>((c) {
                            return DropdownMenuItem(
                              value: c,
                              child: Text("${c.name}"),
                            );
                          }).toList(),
                          onChanged: (value) => value),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            buttonDefault(
                backgroundColor: Global().primaryColor,
                overlayColor: Global().splashPrimaryColor,
                onPressed: () => _form.validateForm(
                    context, _formKey.currentState!.validate()),
                icon: Icon(
                  Icons.check,
                  color: Global().backgroundColor,
                ),
                text: 'Adicionar',
                textColor: Global().backgroundColor),
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.center,
              child: titleInPages(title: "Criar ", subtitle: "Categoria"),
            ),
            const SizedBox(
              height: 30,
            ),
            const Expanded(
              child: CreateCategory(),
            )
          ],
        )),
      ),
    ));
  }
}
// _form.validateForm(context, _formKey.currentState!.validate());