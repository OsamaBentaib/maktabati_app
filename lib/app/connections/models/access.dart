class Access {
  String phone, password;

  Access({
    this.phone,
    this.password,
  });

  factory Access.fromMap(Map<String, dynamic> json) => new Access(
        phone: json["phone"],
        password: json["password"],
      );
  Map<String, dynamic> toMap() => {
        "phone": phone,
        "password": password,
      };
}
