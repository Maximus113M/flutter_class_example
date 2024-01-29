import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/utils.dart';

class CreateGroupDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function(String) leaderValue;
  final Function(String) numberValue;
  final Function(String) programValue;
  final Function() send;
  final Function() cancel;
  final TextEditingController leaderController;
  final TextEditingController numberController;
  final TextEditingController programController;

  const CreateGroupDialog({
    super.key,
    required this.title,
    required this.message,
    required this.leaderValue,
    required this.numberValue,
    required this.programValue,
    required this.send,
    required this.cancel,
    required this.leaderController,
    required this.numberController,
    required this.programController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      surfaceTintColor: Colors.white,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: FontStyles.heading11(AppColors.flutterExample),
          ),
          const Divider(
            indent: 40,
            endIndent: 40,
          ),
        ],
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.01),
        child: SizedBox(
          width: ScreenSize.width * 0.6,
          height: ScreenSize.absoluteHeight * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.absoluteHeight * 0.01),
                child: Text(
                  'Programa',
                  style: FontStyles.bodyBold0(AppColors.text),
                ),
              ),
              TextField(
                controller: programController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Programa",
                ),
                onChanged: (value) => programValue(value),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.absoluteHeight * 0.01),
                child: Text(
                  'Numero',
                  style: FontStyles.bodyBold0(AppColors.text),
                ),
              ),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Numero",
                ),
                onChanged: (value) => numberValue(value),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.absoluteHeight * 0.01),
                child: Text(
                  'Lider',
                  style: FontStyles.bodyBold0(AppColors.text),
                ),
              ),
              TextField(
                controller: leaderController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Lider",
                ),
                onChanged: (value) => leaderValue(value),
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        FilledButton.icon(
          label: const Text("Enviar"),
          onPressed: () => send(),
          icon: const Icon(Icons.send),
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 15,
              ),
            ),
            shape: MaterialStatePropertyAll(
              ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        FilledButton.icon(
          label: const Text("Cancelar"),
          onPressed: () => cancel(),
          icon: const Icon(Icons.cancel),
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 10,
              ),
            ),
            shape: MaterialStatePropertyAll(
              ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
