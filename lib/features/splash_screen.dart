import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/configs/router-configs/route_names.dart';
import 'auth/presentation/controller/auth/auth_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        if (!context.mounted) {
          return;
        }
        _getCurrentUser(ref, context);
      });
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void _getCurrentUser(WidgetRef ref, BuildContext context) async {
    final user = await ref.read(authProvider.notifier).getCurrentUser();

    if (!context.mounted) {
      return;
    }

    if (user != null) {
      context.goNamed(RouteNames.workoutList);
      return;
    }

    context.goNamed(RouteNames.signIn);
  }
}
