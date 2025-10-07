import 'package:flutter/material.dart';

import '../../../../../core/enums/workout_type.dart';
import 'components/workout_components.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const WorkoutAppBar(),
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
  }

  void _showAddWorkoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const WorkoutFormDialog(),
    );
  }
}
