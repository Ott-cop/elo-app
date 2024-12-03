import 'dart:collection';

import 'package:elo/home/menu_home/item_home/category_home_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

class CategoriesHomeProvider extends ChangeNotifier {
  final List<Category> _listCategory = [
    Category(id: "0", name: "Geral"),
  ];

  UnmodifiableListView<Category> get listCategory =>
      UnmodifiableListView(_listCategory);

  add(Category category) {
    _listCategory.add(category);
    notifyListeners();
  }

  remove(String id) {
    _listCategory.removeWhere((category) => category.id == id);
    notifyListeners();
  }
}
