import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/core/shared/loading/loading_screen.dart';
import 'package:flutter_class_example/features/reasons/data/models/reasons_model.dart';
import 'package:flutter_class_example/features/reasons/display/providers/reasons_provider.dart';

import 'package:provider/provider.dart';

class ReasonsScreenBody extends StatelessWidget {
  final List<ReasonModel> reasons;
  const ReasonsScreenBody({
    super.key,
    required this.reasons,
  });

  @override
  Widget build(BuildContext context) {
    return reasons.isEmpty
        ? const LoadingScreen()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: reasons.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadiusDirectional.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3, 5),
                            blurRadius: 10,
                          )
                        ]),
                    child: ListTile(
                      onLongPress: () =>
                          Provider.of<ReasonsProvider>(context, listen: false)
                              .deleteReasonDialog(context, reasons[index].id),
                      leading: Icon(
                        Icons.description,
                        size: ScreenSize.height * 0.05,
                      ),
                      title: Text(
                        '#${reasons[index].id}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        reasons[index].name,
                        style: TextStyle(fontSize: ScreenSize.width * 0.038),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
