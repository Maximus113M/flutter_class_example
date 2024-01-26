import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/utils/screen_size.dart';
import 'package:go_router/go_router.dart';

class CreateMotivoDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function(String) onChange;
  final Function() save;
  
  const CreateMotivoDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onChange,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold),
      ),
      
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, maxLines: 2,textAlign: TextAlign.center, ) ,
            SizedBox(
              height: ScreenSize.absoluteHeight * 0.03,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Nombre",
              ),
              onChanged: (value) => onChange(value),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        FilledButton.icon(
          label: const Text("Enviar"),
          onPressed: () => save(),
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
    );
  }
}
