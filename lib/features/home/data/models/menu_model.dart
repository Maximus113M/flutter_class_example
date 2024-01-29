import 'package:flutter/material.dart';

class MenuModel {
  final String name;
  final String description;
  final String path;
  final IconData icon;

  const MenuModel({
    required this.name,
    required this.description,
    required this.path,
    required this.icon,
  });

  static const menuList = [
    MenuModel(
      name: 'Motivos',
      description: 'Consulta y Gestiona los motivos de salida.',
      path: '/reasons',
      icon: Icons.personal_injury,
    ),
    MenuModel(
      name: 'Fichas',
      description: 'Consulta y Gestiona las fichas registradas.',
      path: '/groups',
      icon: Icons.school,
    ),
    MenuModel(
      name: 'Aprendices',
      description: 'Consulta y Gestiona a los aprendices registrados.',
      path: '/students',
      icon: Icons.group,
    ),
    MenuModel(
      name: 'Animacion',
      description: 'Una animacion sencilla en flutter.',
      path: '/animated',
      icon: Icons.animation,
    ),
  ];
}
