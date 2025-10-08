import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/enums/workout_type.dart';
import '../../../controllers/workout/workout_provider.dart';

class WorkoutList extends ConsumerWidget {
  final WorkoutType type;

  const WorkoutList({super.key, required this.type});

  @override
  Widget build(BuildContext context, ref) {
    final workoutsAsync = ref.watch(workoutProvider);
    return workoutsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Failed to load workouts')),
      data: (unfilteredWorkout) {
        final workouts = unfilteredWorkout
            .where((workout) => workout.type == type)
            .toList();
        if (workouts.isEmpty) {
          return const Center(child: Text("No workout data"));
        }
        return RefreshIndicator(
          onRefresh: () => ref.read(workoutProvider.notifier).refresh(),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final workout = workouts[index];
              return Card(
                child: ListTile(
                  enabled: false,
                  title: Text(
                    workout.name,
                    style: TextStyle(
                      decoration: workout.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: workout.isCompleted ? Colors.grey : Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    '${workout.sets} sets of ${workout.reps} reps at ${workout.weight} kg',
                    style: TextStyle(
                      decoration: workout.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: workout.isCompleted ? Colors.grey : Colors.white,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: workout.isCompleted,
                        onChanged: (_) {
                          ref
                              .read(workoutProvider.notifier)
                              .toggleWorkout(workout);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          ref
                              .read(workoutProvider.notifier)
                              .deleteWorkout(workout.id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
