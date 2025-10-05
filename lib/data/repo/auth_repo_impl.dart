import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data-source/auth/auth_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<String, User>> getCurrentUser() async {
    try {
      final user = await authDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await authDataSource.signInWithEmailAndPassword(email, password);
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signOut() async {
    try {
      await authDataSource.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signUp(User user) async {
    try {
      await authDataSource.signUp(user);
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
