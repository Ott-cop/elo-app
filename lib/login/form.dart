import 'package:elo/login/style/style.dart';
import 'package:elo/login/login_controller.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class LoginInputs extends StatefulWidget {
  const LoginInputs({super.key});
  @override
  State<LoginInputs> createState() => _LoginInputs();
}

class _LoginInputs extends State<LoginInputs> {
  final _iconNotifier = IconStyleNotifier();
  final _formKey = GlobalKey<FormState>();
  final _form = ValidateForm();

  final onFocus = false;

  @override
  void initState() {
    super.initState();
    _iconNotifier.focusEmail
        .addListener(() => _iconNotifier.onFocusChangeEmail());
    _iconNotifier.focusPassword
        .addListener(() => _iconNotifier.onFocusChangePassword());
  }

  @override
  void dispose() {
    super.dispose();
    _iconNotifier.focusEmail
        .removeListener(() => _iconNotifier.onFocusChangeEmail);
    _iconNotifier.focusPassword
        .removeListener(() => _iconNotifier.onFocusChangePassword);
    _iconNotifier.focusEmail.dispose();
    _iconNotifier.focusPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(children: [
          ListenableBuilder(
            listenable: _iconNotifier,
            builder: (context, _) {
              return Focus(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _iconNotifier.focusEmail,
                  validator: (value) => _form.validateEmail(value),
                  decoration: inputDecorationStyle(
                      label: Text(
                        'Email',
                        style: TextStyle(color: _iconNotifier.emailState),
                      ),
                      color: _iconNotifier.emailState,
                      icon: Icon(
                        Icons.email,
                        color: _iconNotifier.emailState,
                      )),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListenableBuilder(
            listenable: _iconNotifier,
            builder: (context, child) {
              return TextFormField(
                obscureText: true,
                focusNode: _iconNotifier.focusPassword,
                validator: (value) => _form.validatePassword(value),
                decoration: inputDecorationStyle(
                    label: Text(
                      'Senha',
                      style: TextStyle(color: _iconNotifier.passwordState),
                    ),
                    color: _iconNotifier.passwordState,
                    icon: Icon(
                      Icons.lock,
                      color: _iconNotifier.passwordState,
                    )),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () => _form.validateForm(
                    context, _formKey.currentState!.validate()),
                style: buttonStyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ENTRAR',
                      style: TextStyle(
                          color: Global().primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.login)
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
