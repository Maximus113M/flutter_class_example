import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/utils.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: ScreenSize.height * 0.2,
        ),
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
    );
  }
}
