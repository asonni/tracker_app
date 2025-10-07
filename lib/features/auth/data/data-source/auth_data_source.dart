import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'firebase_auth_data_source.dart';
import '../../domain/entities/user.dart';

part 'auth_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthDataSource authDataSource(Ref ref) {
  return FirebaseAuthDataSource(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
  );
}

abstract class AuthDataSource {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signUp(User user);
  Future<void> signOut();
  Future<User> getSignedInUser();
}
