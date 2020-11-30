class Parent {
  String city, phone, level, school;

  Parent({
    this.city,
    this.phone,
    this.level,
    this.school,
  });

  factory Parent.fromMap(Map<String, dynamic> json) => new Parent(
        phone: json["phone"],
        level: json["level"],
        city: json["city"],
        school: json["school"],
      );

  Map<String, dynamic> toMap() => {
        "city": city,
        "phone": phone,
        "level": level,
        "school": school,
      };
}
