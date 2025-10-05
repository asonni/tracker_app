import 'package:uuid/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../enums/workout_type.dart';
import '../../models/workout/workout.dart';

part 'workout_provider.g.dart';

@Riverpod(keepAlive: true)
class WorkoutNotifier extends _$WorkoutNotifier {
  final _uuid = const Uuid();

  @override
  List<Workout> build() {
    return [];
  }

  void addWorkout({
    required String name,
    required double weight,
    required int sets,
    required int reps,
    required WorkoutType type,
  }) {
    state = [
      ...state,
      Workout(
        id: _uuid.v4(),
        name: name,
        weight: weight,
        sets: sets,
        reps: reps,
        isCompleted: false,
        type: type,
        createdAt: DateTime.now(),
        completedAt: null,
      ),
    ];
  }

  void toggleWorkoutStatus(String id) {
    state = state
        .map(
          (workout) => workout.id == id
              ? workout.copyWith(
                  isCompleted: !workout.isCompleted,
                  completedAt: workout.isCompleted ? null : DateTime.now(),
                )
              : workout,
        )
        .toList();
  }

  void removeWorkout(String id) {
    state = state.where((workout) => workout.id != id).toList();
  }
}
