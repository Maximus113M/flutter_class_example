import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Hola")),
        backgroundColor: AppColors.flutterExampleBg,
        body: SizedBox(
          child: Column(
            children: [
              Text(
                "Inicio de Sesión",
                style: FontStyles.heading6(AppColors.text),
              ),
              SizedBox(
                height: ScreenSize.height * 0.1,
              ),
              Text(
                "Correo",
                style: FontStyles.heading6(AppColors.text),
              ),
              Text(
                "Contraseña",
                style: FontStyles.heading6(AppColors.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
