import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/app_assets.dart';
import 'package:flutter_class_example/core/utils/screen_size.dart';

class StudentsScreenBody extends StatelessWidget {
  const StudentsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              AppAssets.catKiss,
              height: ScreenSize.absoluteHeight * 0.45,
            ),
          ),
        ),
      ],
    );
  }
}
