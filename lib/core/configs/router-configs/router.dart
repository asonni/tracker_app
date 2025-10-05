import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router_names.dart';
import '../../../providers/auth/auth_provider.dart';
import '../../../presentation/screens/main_screen.dart';
import '../../../presentation/screens/profile_screen.dart';
import '../../../presentation/screens/sign_in_screen.dart';
import '../../../presentation/screens/sign_up_screen.dart';
import '../../../presentation/screens/onboarding_screen.dart';
import '../../../providers/onboarding/onboarding_provider.dart';
import '../../../presentation/screens/workout-list-screen/workout_list_screen.dart';

part 'redirection.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/workout-list",
    errorBuilder: (context, state) {
      return const Scaffold(body: Center(child: Text("Page not found")));
    },
    redirect: (context, state) {
      final redirect = handleRedirect(context, state, ref);
      return redirect;
    },
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RouteNames.onboarding,
        path: "/onboarding",
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: "/sign-up",
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: RouteNames.signIn,
        path: "/sign-in",
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
                path: "/workout-list",
                builder: (context, state) => const WorkoutListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.profile,
                path: "/profile",
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
