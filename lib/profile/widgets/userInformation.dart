import 'package:elo/profile/widgets/inputUserInformation.dart';
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
        InputUserInformation(
          information: "Nome",
          controller: inputControllerName,
        ),
        InputUserInformation(
          information: "Sobrenome",
          controller: inputControllerLastname,
        ),
        InputUserInformation(
          information: "CPF",
          controller: inputControllerCPF,
        ),
        InputUserInformation(
          information: "Número de Telefone",
          controller: inputControllerPhone,
        ),
        InputUserInformation(
          information: "E-mail",
          controller: inputControllerEmail,
        ),
        InputUserInformation(
          information: "Endereço",
          controller: inputControllerAddress,
        ),
        ElevatedButton(
            onPressed: () {
              debugPrint(inputControllerName.text);
              debugPrint(inputControllerLastname.text);
              debugPrint(inputControllerCPF.text);
            },
            child: Text("Salvar"))
      ],
    );
  }
}
