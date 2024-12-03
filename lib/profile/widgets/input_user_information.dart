import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class InputUserInformation extends StatefulWidget {
  final String information;
  final TextEditingController? controller;

  final String? value;

  const InputUserInformation(
      {super.key, required this.information, this.value, this.controller});

  @override
  State<InputUserInformation> createState() => _InputUserInformationState();
}

class _InputUserInformationState extends State<InputUserInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.controller,
          initialValue: widget.value,
          style: TextStyle(color: Theme.of(context).disabledColor),
          decoration: inputDecorationStyle(
              label: Text(widget.information),
              floatingLabel: FloatingLabelBehavior.always),
          enabled: true,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
