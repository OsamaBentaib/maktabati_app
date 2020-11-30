class Location {
  String lat, lng, city;

  Location({
    this.city,
    this.lat,
    this.lng,
  });

  factory Location.fromMap(Map<String, dynamic> json) => new Location(
        lat: json["lat"],
        lng: json["lng"],
        city: json["city"],
      );

  Map<String, dynamic> toMap() => {
        "city": city,
        "lat": lat,
        "lng": lng,
      };
}

class Library {
  String phone;
  Location location;

  Library({
    this.phone,
    this.location,
  });

  factory Library.fromMap(Map<String, dynamic> json) => new Library(
        phone: json["phone"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "location": location,
      };
}
