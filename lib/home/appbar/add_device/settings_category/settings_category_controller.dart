import 'package:elo/home/menu_home/item_home/category_home_model.dart';
import 'package:elo/repositories/categories_home_provider/categories_home_provider.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/v4.dart';

class SettingsCategoryController {
  String? _name;

  Category? _categoryDelete;

  String? validateCategoryName(String? name) {
    if (name == null || name.isEmpty) {
      return "Por favor, insira o nome";
    } else if (name.length < 3 || name.length > 12) {
      return "Por favor, coloque entre 3 a 12 caracteres";
    } else if (name == "Geral") {
      return "Digite um valor que não seja Geral";
    }
    debugPrint("$_name");
    _name = name;
    return null;
  }

  String? validateDeleteCategory(Category category) {
    if (category.name == "Geral") {
      return "Não é possivel deletar o Geral";
    }
    _categoryDelete = category;
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

  void validateDelete(BuildContext context, bool validate) {
    if (validate) {
      var categoryList =
          Provider.of<CategoriesHomeProvider>(context, listen: false);
      var verify = categoryList.listCategory
          .indexWhere((category) => category.name == _name);
      // debugPrint("${_categoryDelete!.name}, ${_categoryDelete!.id}");value
      // var verify = categoryList.listCategory
      // .indexWhere((c) => c.name == _categoryDelete);
      debugPrint('Valor recebido: $verify');
      categoryList.remove(categoryList.listCategory.toList()[verify].id);
      toast(
        message: "Categoria deletada com sucesso!",
        icon: const Icon(
          Icons.check,
        ),
        color: Colors.red,
      ).show(context);
    }
  }
}
