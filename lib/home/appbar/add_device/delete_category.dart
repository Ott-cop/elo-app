import 'package:elo/home/appbar/add_device/settings_category/settings_category_controller.dart';
import 'package:elo/home/menu_home/item_home/category_home_model.dart';
import 'package:elo/repositories/categories_home_provider/categories_home_provider.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteCategory extends StatefulWidget {
  const DeleteCategory({super.key});

  @override
  State<DeleteCategory> createState() => _DeleteCategoryState();
}

class _DeleteCategoryState extends State<DeleteCategory> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SettingsCategoryController _form = SettingsCategoryController();
  bool categoryEnabled = false;
  @override
  Widget build(BuildContext context) {
    final categoryList =
        Provider.of<CategoriesHomeProvider>(context).listCategory.toList();
    if (categoryList.length <= 1) {
      categoryEnabled = false;
    } else {
      categoryEnabled = true;
      int verifyItem = categoryList.indexWhere((index) => index.id == "0");
      if (verifyItem != -1) {
        categoryList.removeAt(verifyItem);
      }
    }

    late TextEditingController categorySelected = TextEditingController();
    InputDecoration inputDecoration = inputDecorationStyle();
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: DropdownMenu(
              width: 200,
              controller: categorySelected,
              hintText: "Sua Categoria",
              enableSearch: false,
              enabled: categoryEnabled,
              inputDecorationTheme: InputDecorationTheme(
                border: inputDecoration.border,
                hoverColor: inputDecoration.hoverColor,
                focusedBorder: inputDecoration.focusedBorder,
                errorBorder: inputDecoration.errorBorder,
                focusedErrorBorder: inputDecoration.errorBorder,
              ),
              dropdownMenuEntries:
                  categoryList.map<DropdownMenuEntry<Category>>((category) {
                return DropdownMenuEntry(
                  label: category.name!,
                  value: category,
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buttonDefault(
              backgroundColor: Global().primaryColor,
              overlayColor: Global().splashPrimaryColor,
              onPressed: () {
                if (_form.validateCategoryName(categorySelected.text) == null) {
                  _form.validateDelete(
                      context, _formKey.currentState!.validate());
                } else {
                  toast(message: "Selecione uma categoria!", color: Colors.red)
                      .show(context);
                }
              },
              icon: Icon(
                Icons.delete,
                color: Global().backgroundColor,
              ),
              text: 'Deletar Categoria',
              textColor: Global().backgroundColor),
        ],
      ),
    );
  }
}
