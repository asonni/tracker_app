import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/enums/workout_type.dart';
import '../../../controllers/workout/workout_provider.dart';

class WorkoutFormDialog extends HookConsumerWidget {
  const WorkoutFormDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final weightController = useTextEditingController();
    final repsController = useTextEditingController();
    final setsController = useTextEditingController();

    final selectedType = useState(WorkoutType.upperBody);
    void submit() {
      if (formKey.currentState?.validate() ?? false) {
        ref
            .read(workoutProvider.notifier)
            .addWorkout(
              nameController.text,
              double.parse(weightController.text),
              int.parse(repsController.text),
              int.parse(setsController.text),
              selectedType.value,
            );
        context.pop();
      }
    }

    return AlertDialog(
      title: const Text('Add Workout'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a name' : null,
            ),
            TextFormField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter weight' : null,
            ),
            TextFormField(
              controller: repsController,
              decoration: const InputDecoration(labelText: 'Reps'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter reps' : null,
            ),
            TextFormField(
              controller: setsController,
              decoration: const InputDecoration(labelText: 'Sets'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter sets' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<WorkoutType>(
              initialValue: selectedType.value,
              onChanged: (value) {
                if (value != null) {
                  selectedType.value = value;
                }
              },
              items: const [
                DropdownMenuItem(
                  value: WorkoutType.upperBody,
                  child: Text('Upper Body'),
                ),
                DropdownMenuItem(
                  value: WorkoutType.lowerBody,
                  child: Text('Lower Body'),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
        TextButton(onPressed: submit, child: const Text('Add')),
      ],
    );
  }
}
