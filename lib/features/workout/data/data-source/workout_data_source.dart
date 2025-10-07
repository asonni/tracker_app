import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/workout.dart';
import 'firebase_workout_data_source.dart';

part 'workout_data_source.g.dart';

@Riverpod(keepAlive: true)
WorkoutDataSource workoutDataSource(Ref ref) {
  return FirebaseWorkoutDataSource();
}

abstract class WorkoutDataSource {
  Future<void> addWorkout(Workout workout);
  Future<List<Workout>> getWorkouts();
  Future<void> updateWorkout(Workout workout);
  Future<void> deleteWorkout(String id);
}
