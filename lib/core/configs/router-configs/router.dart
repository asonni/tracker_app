import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'route_names.dart';
import '../../../features/main_screen.dart';
import '../../../features/splash_screen.dart';
import '../../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../../features/auth/presentation/controller/auth/auth_provider.dart';
import '../../../features/auth/presentation/screens/profile/profile_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../../features/auth/presentation/controller/auth/state/auth_state.dart';
import '../../../features/onboarding/presentation/controllers/onboarding/onboarding_provider.dart';
import '../../../features/workout/presentation/screens/workout-list-screen/workout_list_screen.dart';

part 'redirection.dart';
part 'refresh_listener.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouteNames.splash,
    refreshListenable: _refreshListener(ref),
    redirect: (context, state) {
      final redirect = handleRedirect(context, state, ref);
      return redirect;
    },
    errorBuilder: (context, state) {
      return const Scaffold(body: Center(child: Text("Page not found")));
    },
    routes: [
      GoRoute(
        name: RouteNames.splash,
        path: RouteNames.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: RouteNames.onboarding,
        path: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: RouteNames.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: RouteNames.signIn,
        path: RouteNames.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.workoutList,
                path: RouteNames.workoutList,
                builder: (context, state) => const WorkoutListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.profile,
                path: RouteNames.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
