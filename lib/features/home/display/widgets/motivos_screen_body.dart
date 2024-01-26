import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/screen_size.dart';
import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';

class MotivosScreenBody extends StatelessWidget {
  final HomeProvider homeProvider;
  const MotivosScreenBody({super.key, required this.homeProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {},
            onLongPress: () {},
            leading: Icon(
              Icons.description,
              size: ScreenSize.height * 0.05,
            ),
            title: Text(
              '#${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Cita Medica',
              style: TextStyle(fontSize: ScreenSize.width * 0.038),
            ),
          ),
        );
      },
    );
  }
}
