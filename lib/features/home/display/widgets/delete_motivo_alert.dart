import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class DeleteMotivoAlert extends StatelessWidget {
  final String title;
  final String message;
  final Function() delete;

  const DeleteMotivoAlert({
    super.key,
    required this.title,
    required this.message,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AlertDialog(
        surfaceTintColor: Colors.white,
        title: Text(title),
        content: Text(message),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton.icon(
            label: const Text("Borrar"),
            onPressed: () => delete(),
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
            onPressed: () => context.pop(),
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
      ),
    );
  }
}
