import 'dart:convert';

class Cities {
  String city;

  Cities({
    this.city,
  });

  factory Cities.fromMap(Map<String, dynamic> json) =>
      new Cities(city: json["city"]);

  Map<String, dynamic> toMap() => {
        "city": city,
      };
}

List<Cities> citiesFromJson(String jsonData) {
  final data = json.decode(jsonData)['cities'];
  return List<Cities>.from(data.map((item) => Cities.fromMap(item)));
}

String citiesListToJson(Cities data) {
  final jsonData = data.toMap();
  return json.encode(jsonData);
}
