import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
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
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 8,
        ),
        children: List.generate(
          homeProvider.menuOptions.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => context.push(homeProvider.menuOptions[index].path),
              child: Card(
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(80),
                  ),
                ),
                elevation: 20,
                shadowColor: Colors.black87,
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.03)
                          .copyWith(top: ScreenSize.height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        homeProvider.menuOptions[index].icon,
                        size: ScreenSize.height * 0.1,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      SizedBox(
                        height: ScreenSize.height * 0.01,
                      ),
                      Text(
                        homeProvider.menuOptions[index].name,
                        style: FontStyles.heading11(AppColors.text),
                      ),
                      SizedBox(
                        height: ScreenSize.height * 0.005,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          homeProvider.menuOptions[index].description,
                          style: FontStyles.body1(AppColors.unfocused),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
