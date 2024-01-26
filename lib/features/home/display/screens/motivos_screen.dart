import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/screen_size.dart';
import 'package:flutter_class_example/features/home/display/providers/home_provider.dart';
import 'package:flutter_class_example/features/home/display/widgets/motivos_screen_body.dart';

import 'package:provider/provider.dart';

class MotivosScreen extends StatelessWidget {
  const MotivosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (context
        .select((HomeProvider homeProvider) => homeProvider.motivos.isEmpty)) {
      Provider.of<HomeProvider>(context, listen: false).getMotivos();
    }
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
          onPressed: () =>
              Provider.of<HomeProvider>(context, listen: false).closeMotivosScreen(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
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
      body: MotivosScreenBody(
        motivos:
            Provider.of<HomeProvider>(context).motivos,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton.filled(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(
              ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )),
            onPressed: () => Provider.of<HomeProvider>(context, listen: false)
                .createMotivoDialog(context),
            icon: const Icon(Icons.add),
          ),
          SizedBox(
            height: ScreenSize.height * 0.04,
          ),
        ],
      ),
    );
  }
}
