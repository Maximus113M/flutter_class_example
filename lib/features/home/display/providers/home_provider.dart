import 'package:flutter/material.dart';

import 'package:flutter_class_example/features/home/data/models/menu_model.dart';

class HomeProvider extends ChangeNotifier {
  List<MenuModel> menuOptions = MenuModel.menuList;

  bool isLoading = false;

  HomeProvider();
}
