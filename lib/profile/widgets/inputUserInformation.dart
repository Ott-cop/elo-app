import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class InputUserInformation extends StatefulWidget {
  final String information, text;

  const InputUserInformation(
      {super.key, required this.information, required this.text});

  @override
  State<InputUserInformation> createState() => _InputUserInformationState();
}

class _InputUserInformationState extends State<InputUserInformation> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Form(
          key: _formKey,
          child: TextFormField(
            decoration: inputDecorationStyle(
              floatingLabel: FloatingLabelBehavior.always,
              label: Text(widget.information),
            ),
            enabled: false,
          ),
        )
      ],
    );
  }
}
