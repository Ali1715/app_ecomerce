class User {
  int? id;
  String? name;
  // String? apellido;
  //String? telefono;
  String? email;
  String? password;
  String? token;

  User({
    this.id,
    this.name,
    // this.apellido,
    // this.telefono,
    this.email,
    this.password,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      // apellido: json['user']['apellido'],
      // telefono: json['user']['telefono'],
      email: json['user']['email'],
      password: json['user']['password'],
      token: json['token'],
    );
  }
}
