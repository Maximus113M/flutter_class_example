class MotivosModel {
  final int? id;
  final String name;

  MotivosModel.MotivoModel({
    this.id,
    required this.name,
  });

  factory MotivosModel.fromJson(Map json) => MotivosModel.MotivoModel(
        id: json["id"],
        name: json["nombre"],
      );
}
