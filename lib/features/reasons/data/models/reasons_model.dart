class ReasonModel {
  final int? id;
  final String name;

  ReasonModel({
    this.id,
    required this.name,
  });

  factory ReasonModel.fromJson(Map json) => ReasonModel(
        id: json["id"],
        name: json["nombre"],
      );

  Map<String, dynamic> motivoModelToJson() {
    return {
      'nombre': name,
    };
  }
}
