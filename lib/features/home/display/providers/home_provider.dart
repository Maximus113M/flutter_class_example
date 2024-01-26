import 'package:flutter/material.dart';
import 'package:flutter_class_example/features/home/data/models/menu_model.dart';
import 'package:flutter_class_example/features/home/data/models/motivos_model.dart';
import 'package:flutter_class_example/features/home/display/widgets/create_motivo_alert.dart';
import 'package:flutter_class_example/features/home/display/widgets/create_motivo_dialog.dart';
import 'package:flutter_class_example/features/home/display/widgets/delete_motivo_alert.dart';
import 'package:flutter_class_example/features/home/domain/use_cases/create_motivo_use_case.dart';
import 'package:flutter_class_example/features/home/domain/use_cases/delete_motivo_use_case.dart';
import 'package:flutter_class_example/features/home/domain/use_cases/get_motivos_use_case.dart';
import 'package:go_router/go_router.dart';

class HomeProvider extends ChangeNotifier {
  final GetMotivosUseCase getMotivoUseCase;
  final CreateMotivoUseCase createMotivoUseCase;
  final DeleteMotivoUseCase deleteMotivoUseCase;
  List<MenuModel> menuOptions = MenuModel.menuList;
  List<MotivosModel> motivos = [];
  String newMotivoName = '';

  bool isLoading = false;

  HomeProvider({
    required this.getMotivoUseCase,
    required this.createMotivoUseCase,
    required this.deleteMotivoUseCase,
  });

  getMotivos() async {
    if (isLoading) return;
    isLoading = true;
    motivos = await getMotivoUseCase.getMotivos();
    notifyListeners();
    print(motivos);
    isLoading = false;
  }

  void createMotivo(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;
    MotivosModel motivo = MotivosModel.MotivoModel(name: newMotivoName);
    String title = "Motivo Añadido!";
    String message = "El nuevo motivo ha sido creado con exito";
    await createMotivoUseCase.createMotivo(motivo).then(
      (value) {
        if (!value) {
          title = "Error!";
          message = "Ha ocurrido un error al procesar la solicitud";
        }

        showDialog(
          context: context,
          builder: (context) => CreateMotivoAlert(
            title: title,
            message: message,
            close: () {
              context.pop();
            },
          ),
        );
      },
    );
    isLoading = false;
    motivos.clear();
    notifyListeners();
  }

  void createMotivoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CreateMotivoDialog(
        title: "Nuevo Motivo",
        message: "Ingrese el nombre del nuevo motivo",
        onChange: (p0) => newMotivoName = p0,
        save: () => createMotivo(
          context,
        ),
      ),
    );
  }

  closeMotivosScreen(BuildContext context) {
    motivos.clear();
    context.pop();
  }

  void deleteMotivo(BuildContext context, int id) async {
    if (isLoading) return;
    isLoading = true;

    String title = "Motivo Eliminado!";
    String message = "El archivo ha sido elminado con exito";
    await deleteMotivoUseCase.deleteMotivo(id).then(
      (value) {
        if (!value) {
          title = "Error!";
          message = "Ha ocurrido un error al procesar la solicitud";
        }

        showDialog(
          context: context,
          builder: (context) => CreateMotivoAlert(
            title: title,
            message: message,
            close: () {
              context.pop();
              context.pop();
            },
          ),
        );
        motivos.clear();
        notifyListeners();
      },
    );

    isLoading = false;
  }

  void deleteMotivoDialog(BuildContext context, int? id) {
    if (id != null) {
      showDialog(
        context: context,
        builder: (context) => DeleteMotivoAlert(
            title: "Eliminar Motivo",
            message: "EL archivo no se podrá recuperar, desea continuar?",
            delete: () => deleteMotivo(context, id)),
      );
    }
  }
}
