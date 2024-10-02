import 'package:elo/profile/widgets/inputUserInformation.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InputUserInformation(information: "Nome", text: "Bartholomeu"),
        InputUserInformation(information: "Sobrenome", text: "Santos"),
        InputUserInformation(
            information: "Número de Telefone", text: "(00) 0000-0000"),
        InputUserInformation(
            information: "E-mail", text: "BartholomeuS@gmail.com"),
        InputUserInformation(
            information: "Endereço",
            text: "Rua bartholomeu II, n 000, Barra Bonita"),
        InputUserInformation(information: "CPF", text: "000.000.000-45"),
      ],
    );
  }
}
