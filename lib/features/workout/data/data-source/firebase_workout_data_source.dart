import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/workout.dart';
import 'workout_data_source.dart';

class FirebaseWorkoutDataSource implements WorkoutDataSource {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>> get _workoutsCollection =>
      _firestore.collection('workouts');

  @override
  Future<void> addWorkout(Workout workout) async {
    if (_userId == null) throw Exception('User not authenticated');

    final workoutData = {...workout.toJson(), 'userId': _userId};

    await _workoutsCollection.doc(workout.id).set(workoutData);
  }

  @override
  Future<List<Workout>> getWorkouts() async {
    if (_userId == null) throw Exception('User not authenticated');

    final snapshot = await _workoutsCollection
        .where('userId', isEqualTo: _userId)
        .get();

    return snapshot.docs.map((doc) => Workout.fromJson(doc.data())).toList();
  }

  @override
  Future<void> updateWorkout(Workout workout) async {
    if (_userId == null) throw Exception('User not authenticated');

    // Verify ownership before update
    final doc = await _workoutsCollection.doc(workout.id).get();
    if (doc.data()?['userId'] != _userId) {
      throw Exception('Workout not found or access denied');
    }

    final workoutData = {...workout.toJson(), 'userId': _userId};

    await _workoutsCollection.doc(workout.id).update(workoutData);
  }

  @override
  Future<void> deleteWorkout(String id) async {
    if (_userId == null) throw Exception('User not authenticated');

    // Verify ownership before delete
    final doc = await _workoutsCollection.doc(id).get();
    if (doc.data()?['userId'] != _userId) {
      throw Exception('Workout not found or access denied');
    }

    await _workoutsCollection.doc(id).delete();
  }
}
