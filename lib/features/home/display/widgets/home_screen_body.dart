import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/screen_size.dart';

import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';
import 'package:go_router/go_router.dart';

class HomeScreenBody extends StatelessWidget {
  final HomeProvider homeProvider;

  const HomeScreenBody({super.key, required this.homeProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.02),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8, mainAxisSpacing: 10),
        children: List.generate(
          homeProvider.menuOptions.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => context.push(homeProvider.menuOptions[index].path),
              child: Card(
                elevation: 20,
                shadowColor: Colors.black54,
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.height * 0.04),
                      child: Icon(
                        homeProvider.menuOptions[index].icon,
                        size: ScreenSize.height * 0.1,
                      ),
                    ),
                    Text(
                      homeProvider.menuOptions[index].name,
                      style: TextStyle(
                          fontSize: ScreenSize.width * 0.05,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
