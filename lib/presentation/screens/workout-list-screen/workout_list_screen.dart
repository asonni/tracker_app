import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/workout_components.dart';

import '../../../enums/workout_type.dart';
import '../../../core/configs/router-configs/router_names.dart';

import '../../../providers/workout/workout_provider.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  // ignore: unused_element
  Future<void> _signOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', false);
    if (!context.mounted) {
      return;
    }
    context.goNamed(RouteNames.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        ref.watch(workoutProvider);
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: WorkoutAppBar(),
            body: const TabBarView(
              children: [
                WorkoutList(type: WorkoutType.upperBody),
                WorkoutList(type: WorkoutType.lowerBody),
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
