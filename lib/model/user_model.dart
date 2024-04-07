class UserModel {
  final String id;
  final String name;
  final String email;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
  });
  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          email: json['email'],
        );
  Map<String, dynamic> toJosn() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
