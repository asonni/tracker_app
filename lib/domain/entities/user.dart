import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? bio;
  final bool isAuthenticated;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    this.isAuthenticated = false,
  });

  @override
  List<Object?> get props => [id, name, email, bio, isAuthenticated];
}
