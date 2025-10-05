import '../../../domain/entities/user.dart';

abstract class AuthDataSource {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signUp(User user);
  Future<void> signOut();
  Future<User> getCurrentUser();
}
