import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/workout_type.dart';

part 'workout.g.dart';
part 'workout.freezed.dart';

@freezed
abstract class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String name,
    required double weight,
    required int reps,
    required int sets,
    required bool isCompleted,
    required WorkoutType type,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}
