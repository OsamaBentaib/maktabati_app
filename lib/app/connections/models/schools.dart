import 'dart:convert';

class Schools {
  String city, name, id;

  Schools({this.city, this.name, this.id});

  factory Schools.fromMap(Map<String, dynamic> json) => new Schools(
        id: json["_id"],
        name: json["name"],
        city: json["city"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "city": city,
      };
}

List<Schools> citiesFromJson(String jsonData) {
  final data = json.decode(jsonData)['schools'];
  return List<Schools>.from(data.map((item) => Schools.fromMap(item)));
}

String citiesListToJson(Schools data) {
  final jsonData = data.toMap();
  return json.encode(jsonData);
}
