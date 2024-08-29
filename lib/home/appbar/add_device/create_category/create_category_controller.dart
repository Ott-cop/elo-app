import 'package:elo/home/menu_home/item_home/category_home_model.dart';
import 'package:elo/repositories/categories_home_provider/categories_home_provider.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/v4.dart';

class CreateCategoryController {
  String? _name;

  String? validateCategoryName(String? name) {
    if (name == null || name.isEmpty) {
      return "Por favor, insira o nome";
    } else if (name.length < 3 || name.length > 12) {
      return "Por favor, coloque entre 3 a 12 caracteres";
    }
    _name = name;
    debugPrint("$_name");
    return null;
  }

  void validate(BuildContext context, bool validate) {
    if (validate) {
      var categoryList =
          Provider.of<CategoriesHomeProvider>(context, listen: false);
      var verify = categoryList.listCategory
          .indexWhere((category) => category.name == _name);
      if (verify > -1) {
        toast(
          message: "Já existe uma categoria com esse nome!",
          icon: const Icon(
            Icons.close,
          ),
          color: Colors.red,
        ).show(context);
        return;
      }

      categoryList.add(Category(id: const UuidV4().generate(), name: _name));
      toast(
        message: "Categoria criada com sucesso!",
        icon: const Icon(
          Icons.check,
        ),
        color: Colors.green,
      ).show(context);
    }
  }
}
