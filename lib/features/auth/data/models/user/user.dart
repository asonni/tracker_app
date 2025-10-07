import '../../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.password,
    required super.bio,
  });
  // fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
    );
  }
  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'name': super.name,
      'email': super.email,
      'bio': super.bio,
    };
  }

  // copy with
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? bio,
    String? password,
  }) {
    return UserModel(
      id: id ?? super.id,
      name: name ?? super.name,
      email: email ?? super.email,
      bio: bio ?? super.bio,
      password: password ?? super.password,
    );
  }

  // from entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      bio: user.bio,
      password: user.password,
    );
  }
}
