import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/workout.dart';
import '../../data/repo/workout_repo_impl.dart';
import '../../data/data-source/workout_data_source.dart';

part 'workout_repo.g.dart';

@riverpod
WorkoutRepo workoutRepository(Ref ref) {
  return WorkoutRepoImpl(
    workoutDataSource: ref.read(workoutDataSourceProvider),
  );
}

abstract class WorkoutRepo {
  Future<Either<String, Unit>> addWorkout(Workout workout);
  Future<Either<String, List<Workout>>> getWorkouts();
  Future<Either<String, Unit>> updateWorkout(Workout workout);
  Future<Either<String, Unit>> deleteWorkout(String id);
}
