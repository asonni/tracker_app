import '../../../domain/entities/user.dart';

class FirebaseUser extends User {
  const FirebaseUser({
    required super.id,
    required super.email,
    required super.name,
    required super.bio,
  });

  // from Doc
  factory FirebaseUser.fromDoc(Map<String, dynamic> doc) {
    return FirebaseUser(
      id: doc['id'] as String,
      email: doc['email'] as String,
      name: doc['name'] as String,
      bio: doc['bio'] as String,
    );
  }

  // to Doc
  Map<String, dynamic> toDoc() {
    return {'id': id, 'email': email, 'name': name, 'bio': bio};
  }

  // from entity
  factory FirebaseUser.fromEntity(User user) {
    return FirebaseUser(
      id: user.id,
      email: user.email,
      name: user.name,
      bio: user.bio ?? '',
    );
  }
}
