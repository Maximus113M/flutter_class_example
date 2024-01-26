import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/screen_size.dart';
import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';
import 'package:flutter_class_example/features/home/display/widgets/home_screen_body.dart';
import 'package:flutter_class_example/features/home/display/widgets/motivos_screen_body.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class MotivosScreen extends StatelessWidget {
  const MotivosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Motivos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[700],
        surfaceTintColor: Colors.red,
        elevation: 15,
        shadowColor: Colors.black,
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
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
      body: MotivosScreenBody(homeProvider: Provider.of<HomeProvider>(context)),
    );
  }
}
