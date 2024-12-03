import 'package:elo/login/form.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global().backgroundColor,
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage("assets/logo/Logo_Oner.png"),
                    height: 80,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Seja bem-vindo!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              LoginInputs()
            ],
          ),
        ),
      ),
    );
  }
}
