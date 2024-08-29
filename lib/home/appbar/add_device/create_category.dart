import 'package:elo/home/appbar/add_device/create_category/create_category_controller.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final CreateCategoryController _form = CreateCategoryController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              validator: (categoryName) =>
                  _form.validateCategoryName(categoryName),
              decoration: inputDecorationStyle(hint: "Nome da Categoria"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buttonDefault(
              backgroundColor: Global().primaryColor,
              overlayColor: Global().splashPrimaryColor,
              onPressed: () =>
                  _form.validate(context, _formKey.currentState!.validate()),
              icon: Icon(
                Icons.check,
                color: Global().backgroundColor,
              ),
              text: 'Criar Categoria',
              textColor: Global().backgroundColor),
        ],
      ),
    );
  }
}
