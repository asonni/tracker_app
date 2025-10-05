import '../../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.bio,
    super.isAuthenticated,
  });
  // fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      bio: json['bio'],
      isAuthenticated: json['isAuthenticated'] ?? false,
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'bio': bio,
      'isAuthenticated': isAuthenticated,
    };
  }

  // cpy with
  UserModel copyWith({String? id, String? name, String? email, String? bio}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      bio: bio ?? this.bio,
    );
  }

  // from entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      bio: user.bio,
    );
  }
}
