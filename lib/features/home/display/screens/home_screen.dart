import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';
import 'package:flutter_class_example/features/home/display/widgets/home_screen_body.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.flutterExampleBg,
      appBar: AppBar(
        title: const Text(
          "Flutter Example",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: const FlutterLogo(),
        backgroundColor: AppColors.flutterExample,
        elevation: 15,
        shadowColor: Colors.black,
        actions: const [
          Icon(
            Icons.logout,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
      ),
      body: HomeScreenBody(homeProvider: Provider.of<HomeProvider>(context)),
    );
  }
}
