import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/features/reasons/display/providers/reasons_provider.dart';
import 'package:flutter_class_example/features/reasons/display/widgets/reasons_screen_body.dart';

import 'package:provider/provider.dart';

class ReasonsScreen extends StatelessWidget {
  const ReasonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.select(
        (ReasonsProvider reasonsProvider) => reasonsProvider.reasons.isEmpty)) {
      Provider.of<ReasonsProvider>(context, listen: false).getReasons(context);
    }
    return Scaffold(
      backgroundColor: AppColors.flutterExampleBg,
      appBar: AppBar(
        title: const Text(
          "Motivos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.flutterExample,
        elevation: 15,
        shadowColor: Colors.black,
        leading: IconButton(
          onPressed: () => Provider.of<ReasonsProvider>(context, listen: false)
              .closeReasonsScreen(context),
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
      body: ReasonsScreenBody(
        reasons: Provider.of<ReasonsProvider>(context).reasons,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<ReasonsProvider>(context, listen: false)
            .createReasonDialog(context),
        backgroundColor: AppColors.flutterExample.withOpacity(0.3),
        child: const Icon(
          Icons.add,
          color: AppColors.contrast,
        ),
      ),
    );
  }
}
