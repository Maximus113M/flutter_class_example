class GroupModel {
  final int? id;
  final String leader;
  final String program;
  final int number;

  GroupModel({
    this.id,
    required this.leader,
    required this.program,
    required this.number,
  });

  factory GroupModel.fromJson(Map json) => GroupModel(
        id: json["id"],
        leader: json["lider"],
        program: json["programa"],
        number: json["numero"],
      );

  Map<String, dynamic> groupModelToJson() => {
        'lider': leader,
        'programa': program,
        'numero': number,
      };
}
