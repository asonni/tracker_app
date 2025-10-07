import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import '../../../../core/extensions/firebase_firestore_extensions.dart';

import '../../domain/entities/user.dart';
import '../models/user/firebase_user.dart';
import 'auth_data_source.dart';

class FirebaseAuthDataSource implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  FirebaseAuthDataSource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseAuth = firebaseAuth,
       _firebaseFirestore = firebaseFirestore;

  @override
  Future<FirebaseUser> getSignedInUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('User not found');
      }
      final userId = user.uid;
      final userDoc = await _firebaseFirestore.userDocument(userId).get();

      if (!userDoc.exists) {
        throw Exception('User not found');
      }
      final firebaseUser = FirebaseUser.fromDoc(userDoc);
      return firebaseUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      /// sign-in on firebase-auth.
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUp(User user) async {
    try {
      final firebaseUser = FirebaseUser.fromEntity(user);
      // create a user on firebase-auth.
      final cred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: firebaseUser.email!,
        password: firebaseUser.password!,
      );
      if (cred.user == null) {
        throw Exception('User not created');
      }
      final userId = cred.user?.uid;
      // save user to firestore.
      await _firebaseFirestore.userDocument(userId).set(firebaseUser.toDoc());
    } catch (e) {
      rethrow;
    }
  }
}
