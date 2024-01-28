import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/utils.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              Icons.travel_explore,
              size: ScreenSize.height * 0.1,
              color: AppColors.unfocused,
            ),
          ),
          Text(
            'Buscando \ndatos',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.unfocused, fontSize: ScreenSize.width * 0.05),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.25, vertical: 20),
            child: const LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
