import 'package:dartz/dartz.dart';

import '../models/workout.dart';
import '../data-source/workout_data_source.dart';
import '../../domain/repositories/workout_repo.dart';
import '../../../../core/handlers/error-handler/error_handler.dart';

class WorkoutRepoImpl implements WorkoutRepo {
  final WorkoutDataSource workoutDataSource;

  WorkoutRepoImpl({required this.workoutDataSource});

  @override
  Future<Either<String, Unit>> addWorkout(Workout workout) async {
    try {
      await workoutDataSource.addWorkout(workout);
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, List<Workout>>> getWorkouts() async {
    try {
      final workouts = await workoutDataSource.getWorkouts();
      return Right(workouts);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> updateWorkout(Workout workout) async {
    try {
      await workoutDataSource.updateWorkout(workout);
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> deleteWorkout(String id) async {
    try {
      await workoutDataSource.deleteWorkout(id);
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
