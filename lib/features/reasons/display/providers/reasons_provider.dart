import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/core/shared/alerts/delete_alert.dart';
import 'package:flutter_class_example/features/reasons/data/models/reasons_model.dart';
import 'package:flutter_class_example/features/reasons/display/widgets/create_reason_dialog.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/get_reasons_use_case.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/create_reason_use_case.dart';
import 'package:flutter_class_example/features/reasons/domain/use_cases/delete_reason_use_case.dart';

import 'package:go_router/go_router.dart';

class ReasonsProvider extends ChangeNotifier {
  final CreateReasonsUseCase createReasonUseCase;
  final DeleteReasonUseCase deleteReasonUseCase;
  final GetReasonsUseCase getReasonsUseCase;
  List<ReasonModel> reasons = [];
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
    result.fold((l) {
      InAppNotification.serverFailure(
        context: context,
        message: l.message,
      );
    }, (r) {
      reasons = r;
      isLoading = false;
    });
    notifyListeners();
    
  }

  void createReason(BuildContext context) async {
    if (isLoading) return;
    if (!validateName()) {
      InAppNotification.showAppNotification(
          context: context,
          title: 'Datos Invalidos!',
          message:
              'Por favor revise la informacion, no pueden haber campos vacios',
          type: NotificationType.warning);
      return;
    }
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
        message: "Por favor, ingrese el nombre del nuevo motivo.",
        onChange: (p0) => newReasonName = p0,
        save: () => createReason(
          context,
        ),
      ),
    );
  }

  bool validateName() {
    if (newReasonName.trim().isNotEmpty) return true;
    return false;
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
        builder: (context) => DeleteAlert(
            title: "Eliminar Motivo",
            message: "El archivo no se podrá recuperar, desea continuar?",
            delete: () => deleteReason(context, id)),
      );
    }
  }
}
