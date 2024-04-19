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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Global().backgroundColor, Global().primaryColor],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        )),
        child: Center(
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Image(
                      image: AssetImage("assets/logo/New-Logo.png"),
                      height: 200,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: 'Seja bem-vindo à\n',
                          children: [
                            TextSpan(
                                text: 'ELO!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Global().primaryColor))
                          ],
                          style: const TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.normal,
                          ),
                        ))
                  ],
                ),
                const LoginInputs()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
