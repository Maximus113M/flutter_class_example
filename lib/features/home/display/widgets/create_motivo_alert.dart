import 'package:flutter/material.dart';

class CreateMotivoAlert extends StatelessWidget {
  final String title;
  final String message;
  final Function() close;
  const CreateMotivoAlert({
    super.key,
    required this.title,
    required this.message, required this.close,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        FilledButton.icon(
          label: const Text("Ok"),
          onPressed: () => close(),
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
      ],
    );
  }
}
