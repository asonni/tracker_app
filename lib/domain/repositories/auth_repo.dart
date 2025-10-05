import 'package:dartz/dartz.dart';

import '../entities/user.dart';

abstract class AuthRepo {
  Future<Either<String, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<String, Unit>> signUp(User user);
  Future<Either<String, Unit>> signOut();
  Future<Either<String, User>> getCurrentUser();
}
