import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/features/students/widgets/students_screen_body.dart';
import 'package:go_router/go_router.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.text,
      appBar: AppBar(
        title: const Text(
          "Aprendices",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.flutterExample,
        elevation: 15,
        shadowColor: Colors.black,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
      ),
      body: const StudentsScreenBody(),
    );
  }
}
