import 'package:flutter/material.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/features/reasons/data/models/reasons_model.dart';
import 'package:flutter_class_example/features/reasons/display/widgets/delete_reason_alert.dart';
import 'package:flutter_class_example/features/reasons/display/widgets/create_reason_dialog.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/get_reasons_use_case.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/create_reason_use_case.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/delete_reason_use_case.dart';

import 'package:go_router/go_router.dart';

class ReasonsProvider extends ChangeNotifier {
  final CreateReasonsUseCase createReasonUseCase;
  final DeleteReasonUseCase deleteReasonUseCase;
  final GetReasonsUseCase getReasonsUseCase;
  List<ReasonModel> reasons = [ReasonModel(id: 1, name: 'Enfermedad')];
  String newReasonName = '';

  bool isLoading = false;

  ReasonsProvider({
    required this.createReasonUseCase,
    required this.deleteReasonUseCase,
    required this.getReasonsUseCase,
  });

  getReasons(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;
    final result = await getReasonsUseCase(NoParams());
    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ),
        (r) => reasons = r);
    notifyListeners();
    isLoading = false;
  }

  void createReason(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;
    ReasonModel reason = ReasonModel(name: newReasonName);

    final result = await createReasonUseCase(reason);
    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (r) {
      String title = "Motivo Agregado!";
      String message = "El nuevo motivo ha sido creado con exito";
      NotificationType type = NotificationType.success;

      if (!r) {
        title = "Oh no!";
        message =
            "Ha ocurrido un error al procesar la solicitud, intente de nuevo";
        type = NotificationType.warning;
      }
      InAppNotification.showAppNotification(
        context: context,
        title: title,
        message: message,
        type: type,
      );
    });

    isLoading = false;
    reasons.clear();
    notifyListeners();
  }

  void createReasonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CreateReasonDialog(
        title: "Nuevo Motivo",
        message: "Ingrese el nombre del nuevo motivo",
        onChange: (p0) => newReasonName = p0,
        save: () => createReason(
          context,
        ),
      ),
    );
  }

  closeReasonsScreen(BuildContext context) {
    reasons.clear();
    context.pop();
  }

  void deleteReason(BuildContext context, int id) async {
    if (isLoading) return;
    isLoading = true;

    final result = await deleteReasonUseCase(id);
    result.fold(
        (l) => InAppNotification.serverFailure(
            context: context, message: l.message), (r) {
      String title = "Motivo Eliminado!";
      String message = "El nuevo motivo ha sido eliminado con exito";
      NotificationType type = NotificationType.success;
      if (!r) {
        title = 'Oh, no!';
        message = "Ha ocurrido un error al procesar la solicitud";
        type = NotificationType.warning;
      }

      InAppNotification.showAppNotification(
        context: context,
        title: title,
        message: message,
        type: type,
      );
      reasons.clear();
      notifyListeners();
    });

    isLoading = false;
  }

  void deleteReasonDialog(BuildContext context, int? id) {
    if (id != null) {
      showDialog(
        context: context,
        builder: (context) => DeleteReasonAlert(
            title: "Eliminar Motivo",
            message: "El archivo no se podrá recuperar, desea continuar?",
            delete: () => deleteReason(context, id)),
      );
    }
  }
}
