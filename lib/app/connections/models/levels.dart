import 'dart:convert';

class Levels {
  String id, name;

  Levels({
    this.id,
    this.name,
  });
  factory Levels.fromJson(Map<String, dynamic> json) {
    return Levels(id: json["_id"], name: json["name"]);
  }
}

class SchoolTypes {
  String id, addedAt, type;
  List<Levels> levels;
  SchoolTypes({
    this.id,
    this.type,
    this.addedAt,
    this.levels,
  });

  factory SchoolTypes.fromJson(Map<String, dynamic> json) {
    var levels = json['levels'] as List;
    List<Levels> levelsLists = levels.map((e) => Levels.fromJson(e)).toList();
    return SchoolTypes(
      id: json["_id"],
      type: json["type"],
      addedAt: json["addedAt"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "type": type,
      "addedAt": addedAt,
    };
  }
}

List<SchoolTypes> schoolTypesFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<SchoolTypes>.from(data.map((item) => SchoolTypes.fromJson(item)));
}

String schoolTypesListToJson(SchoolTypes data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
