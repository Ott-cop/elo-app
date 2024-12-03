import 'package:elo/profile/widgets/input_user_information.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final TextEditingController inputControllerName = TextEditingController();
  final TextEditingController inputControllerLastname = TextEditingController();
  final TextEditingController inputControllerCPF = TextEditingController();
  final TextEditingController inputControllerPhone = TextEditingController();
  final TextEditingController inputControllerEmail = TextEditingController();
  final TextEditingController inputControllerAddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InputUserInformation(
          information: "Nome",
          value: "Bartholomeu",
          // controller: inputControllerName,
        ),
        const InputUserInformation(
          information: "Sobrenome",
          value: "Silva",
          // controller: inputControllerLastname,
        ),
        const InputUserInformation(
          information: "CPF",
          value: "000.000.000-00",
          // controller: inputControllerCPF,
        ),
        const InputUserInformation(
          information: "Número de Telefone",
          value: "(14) 99999-9999",
          // controller: inputControllerPhone,
        ),
        const InputUserInformation(
          information: "E-mail",
          value: "bartholomeusilva@email.com",
          // controller: inputControllerEmail,
        ),
        const InputUserInformation(
          information: "Endereço",
          value: "Rua Bartholomeu Silva",
          // controller: inputControllerAddress,
        ),
        const SizedBox(
          height: 20,
        ),
        buttonDefault(
            onPressed: () {
              debugPrint(inputControllerName.text);
              debugPrint(inputControllerLastname.text);
              debugPrint(inputControllerCPF.text);
            },
            textColor: Global().primaryColor,
            icon: Icon(Icons.save),
            // backgroundColor: Global().primaryColor,
            text: 'Salvar')
      ],
    );
  }
}
