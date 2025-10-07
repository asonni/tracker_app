import 'package:uuid/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/workout.dart';
import '../../../../../core/enums/workout_type.dart';
import '../../../domain/repositories/workout_repo.dart';

part 'workout_provider.g.dart';

@riverpod
class WorkoutNotifier extends _$WorkoutNotifier {
  @override
  List<Workout> build() {
    _loadWorkouts();
    return [];
  }

  Future<void> _loadWorkouts() async {
    final result = await ref.read(workoutRepositoryProvider).getWorkouts();
    result.fold(
      (error) => throw Exception(error),
      (workouts) => state = workouts,
    );
  }

  Future<void> addWorkout(
    String name,
    double weight,
    int reps,
    int sets,
    WorkoutType type,
  ) async {
    final workout = Workout(
      id: const Uuid().v4(),
      name: name,
      weight: weight,
      reps: reps,
      sets: sets,
      type: type,
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    final result = await ref
        .read(workoutRepositoryProvider)
        .addWorkout(workout);
    result.fold(
      (error) => throw Exception(error),
      (_) => state = [...state, workout],
    );
  }

  Future<void> toggleWorkout(Workout workout) async {
    final updatedWorkout = workout.copyWith(
      isCompleted: !workout.isCompleted,
      completedAt: workout.isCompleted ? null : DateTime.now(),
    );
    // update the workout in the state
    state = state
        .map((w) => w.id == updatedWorkout.id ? updatedWorkout : w)
        .toList();
    await ref.read(workoutRepositoryProvider).updateWorkout(updatedWorkout);
    _loadWorkouts();
  }

  Future<void> deleteWorkout(String id) async {
    /// remove from state first
    state = state.where((w) => w.id != id).toList();
    await ref.read(workoutRepositoryProvider).deleteWorkout(id);
    _loadWorkouts();
  }
}
