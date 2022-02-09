class UserTb {
  int? id;
  String? name;
  String? password;
  String? email;

  UserTb({this.id, this.name, this.password, this.email});

  factory UserTb.fromJson(Map<String, dynamic> json) {
    return UserTb(
      id: json['id'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
    );
  }
}
