import 'package:flutter/material.dart';

class MenuModel {
  final String name;
  final String path;
  final IconData icon;

  const MenuModel({
    required this.name,
    required this.path,
    required this.icon,
  });

  static const menuList = [
    MenuModel(
      name: 'Motivos',
      path: '/motivos',
      icon: Icons.personal_injury,
    ),
    MenuModel(
      name: 'Aprendices',
      path: '/aprendices',
      icon: Icons.group,
    ),
  ];
}
