class FichaModel {
  final int? id;
  final String lead;
  final String program;
  final int number;

  FichaModel({
    this.id,
    required this.lead,
    required this.program,
    required this.number,
  });

  factory FichaModel.fromJson(Map json) => FichaModel(
        id: json["id"],
        lead: json["nombre"],
        program: json[""],
        number: json[""],
      );
}
