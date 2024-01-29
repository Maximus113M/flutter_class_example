import 'package:flutter/material.dart';

import 'package:flutter_class_example/core/utils/utils.dart';
import 'package:flutter_class_example/core/helpers/use_case.dart';
import 'package:flutter_class_example/core/shared/alerts/delete_alert.dart';
import 'package:flutter_class_example/features/groups/data/models/group_model.dart';
import 'package:flutter_class_example/features/groups/display/widgets/create_group_dialog.dart';
import 'package:flutter_class_example/features/groups/domain/use_cases/create_group_use_case.dart';
import 'package:flutter_class_example/features/groups/domain/use_cases/delete_group_use_case.dart';
import 'package:flutter_class_example/features/groups/domain/use_cases/get_reasons_use_case.dart';
import 'package:flutter_class_example/features/groups/domain/use_cases/update_group_use_case.dart';

import 'package:go_router/go_router.dart';

class GroupsProvider extends ChangeNotifier {
  final GetGroupsUseCase getGroupsUseCase;
  final CreateGroupUseCase createGroupUseCase;
  final UpdateGroupUseCase updateGroupUseCase;
  final DeleteGroupUseCase deleteGroupUseCase;
  TextEditingController leaderController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController programController = TextEditingController();

  List<GroupModel> groups = [
    GroupModel(
        id: 1,
        leader: 'Freddy Mendez',
        program: 'Analisis y desarrollo de software',
        number: 2556873),
    GroupModel(
        id: 2,
        leader: 'Freddy Mendez',
        program: 'Analisis y desarrollo de software',
        number: 2556873),
    GroupModel(
        id: 3,
        leader: 'Freddy Mendez',
        program: 'Analisis y desarrollo de software',
        number: 2556873),
  ];
  bool isLoading = false;

  GroupsProvider({
    required this.getGroupsUseCase,
    required this.createGroupUseCase,
    required this.updateGroupUseCase,
    required this.deleteGroupUseCase,
  });

  getGroups(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;
    final result = await getGroupsUseCase(NoParams());
    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ),
        (r) => groups = r);
    notifyListeners();
    isLoading = false;
  }

  void createGroup(BuildContext context) async {
    if (isLoading) return;
    if (!validateLeader() || !validateProgram() || !validateNumber()) {
      InAppNotification.showAppNotification(
          context: context,
          title: 'Datos Invalidos!',
          message:
              'Por favor revise los informacion, no pueden haber campos vacios y numeros sin (.), (,) o (-).',
          type: NotificationType.warning);
      return;
    }

    isLoading = true;
    GroupModel newGroup = GroupModel(
      leader: leaderController.text,
      number: int.parse(numberController.text),
      program: programController.text,
    );

    final result = await createGroupUseCase(newGroup);
    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (r) {
      String title = "Ficha Agregada!";
      String message = "La nueva ficha ha sido creada con exito";
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
    groups.clear();
    notifyListeners();
  }

  void createGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CreateGroupDialog(
        title: "Nueva Ficha",
        message: "Por favor, ingrese los datos de la nueva ficha.",
        programController: programController,
        numberController: numberController,
        leaderController: leaderController,
        programValue: (p0) => programController.text = p0,
        numberValue: (p0) => numberController.text = p0,
        leaderValue: (p0) => leaderController.text = p0,
        send: () => createGroup(
          context,
        ),
        cancel: () {
          clearTextControllers();
          context.pop();
        },
      ),
    );
  }

  void updateGroup(BuildContext context, int id) async {
    if (isLoading) return;
    if (!validateLeader() || !validateProgram() || !validateNumber()) {
      InAppNotification.showAppNotification(
          context: context,
          title: 'Datos Invalidos!',
          message:
              'Por favor revise los informacion, no pueden haber campos vacios y numeros sin (.), (,) o (-).',
          type: NotificationType.warning);
      return;
    }

    isLoading = true;
    GroupModel updateGroup = GroupModel(
      id: id,
      leader: leaderController.text,
      number: int.parse(numberController.text),
      program: programController.text,
    );

    final result = await updateGroupUseCase(updateGroup);
    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (r) {
      String title = "Ficha Actualizada!";
      String message = "La ficha ha sido actualizada con exito";
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
    clearTextControllers();
    isLoading = false;
    groups.clear();
    notifyListeners();
  }

  void updateGroupDialog(BuildContext context, GroupModel group) {
    programController.text = group.program;
    numberController.text = "${group.number}";
    leaderController.text = group.leader;
    showDialog(
      context: context,
      builder: (context) => CreateGroupDialog(
        title: "Editar Ficha",
        message:
            "Por favor, ingrese los datos que desea actualiza de la ficha.",
        programController: programController,
        numberController: numberController,
        leaderController: leaderController,
        programValue: (p0) => programController.text = p0,
        numberValue: (p0) => numberController.text = p0,
        leaderValue: (p0) => leaderController.text = p0,
        send: () => updateGroup(context, group.id!),
        cancel: () {
          clearTextControllers();
          context.pop();
        },
      ),
    );
  }

  void clearTextControllers() {
    programController.text = '';
    numberController.text = '';
    leaderController.text = '';
  }

  bool validateLeader() {
    if (leaderController.text.trim().isNotEmpty) return true;
    return false;
  }

  bool validateProgram() {
    if (programController.text.trim().isNotEmpty) return true;
    return false;
  }

  bool validateNumber() {
    if (numberController.text.trim().isEmpty) return false;

    if (numberController.text.contains('.') ||
        numberController.text.contains(',') ||
        numberController.text.contains('-')) {
      return false;
    }
    if (int.parse(numberController.text.trim()) < 0) return false;

    return true;
  }

  closeGroopScreen(BuildContext context) {
    //groups.clear();
    context.pop();
  }

  void deleteGroup(BuildContext context, int id) async {
    if (isLoading) return;
    isLoading = true;

    final result = await deleteGroupUseCase(id);
    result.fold(
      (l) =>
          InAppNotification.serverFailure(context: context, message: l.message),
      (r) {
        String title = "Ficha Eliminada!";
        String message = "La Ficha ha sido eliminada con exito";
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
        groups.clear();
        notifyListeners();
      },
    );

    isLoading = false;
  }

  void deleteGroupDialog(BuildContext context, int? id) {
    if (id != null) {
      showDialog(
        context: context,
        builder: (context) => DeleteAlert(
            title: "Desea eliminar esta ficha?",
            message: "Los datos no se podrán recuperar, desea continuar?",
            delete: () => deleteGroup(context, id)),
      );
    }
  }
}
