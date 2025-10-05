import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_in_screen.dart';

import '../enums/workout_type.dart';

import '../widgets/workout_form_dialog.dart';
import '../widgets/workout_calendar_graph.dart';

import '../providers/quote/quote_provider.dart';
import '../providers/workout/workout_provider.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  // ignore: unused_element
  Future<void> _signOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', false);
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        ref.watch(workoutProvider);
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const SizedBox.shrink(),
              toolbarHeight: 224,
              flexibleSpace: SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 56.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final quote = ref.watch(fetchQuoteProvider);
                            ref.listen(fetchQuoteProvider, (previous, next) {
                              next.maybeWhen(
                                data: (data) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('"${data.quote}"')),
                                  );
                                },
                                orElse: () {},
                              );
                            });
                            return quote.map(
                              data: (data) {
                                return Column(
                                  children: [
                                    Text(
                                      '"${data.value.quote}"',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        // final _ = ref.refresh(
                                        //   fetchQuoteProvider,
                                        // );
                                        ref.invalidate(fetchQuoteProvider);
                                      },
                                      child: const Text('Refresh Quote'),
                                    ),
                                  ],
                                );
                              },
                              error: (error) {
                                return Text(
                                  'Failed to load quote',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                );
                              },
                              loading: (_) {
                                return const CircularProgressIndicator();
                              },
                            );
                          },
                        ),
                        WorkoutCalendarGraph(),
                      ],
                    ),
                  ),
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(48),
                child: TabBar(
                  tabs: [
                    Tab(text: 'Upper Body'),
                    Tab(text: 'Lower Body'),
                  ],
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                _WorkoutList(type: WorkoutType.upperBody),
                _WorkoutList(type: WorkoutType.lowerBody),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showAddWorkoutDialog(context),
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }

  void _showAddWorkoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const WorkoutFormDialog(),
    );
  }
}

class _WorkoutList extends ConsumerWidget {
  final WorkoutType type;

  const _WorkoutList({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unfilteredWorkout = ref.watch(workoutProvider);
    final workouts = unfilteredWorkout
        .where((workout) => workout.type == type)
        .toList();

    if (workouts.isEmpty) {
      return const Center(child: Text('No workouts added yet.'));
    }

    return ListView.builder(
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
                        .toggleWorkoutStatus(workout.id);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref
                        .read(workoutProvider.notifier)
                        .removeWorkout(workout.id);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
