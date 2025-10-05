part of 'router.dart';

FutureOr<String?> handleRedirect(
  BuildContext context,
  GoRouterState state,
  Ref ref,
) {
  final publicRoutes =
      state.matchedLocation == RouteNames.signIn ||
      state.matchedLocation == RouteNames.signUp ||
      state.matchedLocation == RouteNames.onboarding;

  if (publicRoutes) {
    return null;
  }

  // check if the user has seen the onboarding screen
  final hasSeenOnboarding = _hasSeenOnboarding(ref);

  if (!hasSeenOnboarding) {
    return RouteNames.onboarding;
  }

  // check if the user is logged in or not
  final isAuthenticated = _isAuthenticated(ref);

  if (!isAuthenticated) {
    return RouteNames.signIn;
  }

  return null;
}

bool _isAuthenticated(Ref ref) {
  final user = ref.read(authProvider);
  return user?.isAuthenticated == true;
}

bool _hasSeenOnboarding(Ref ref) {
  final hasSeenOnboarding = ref.read(hasSeenOnboardingProvider);
  return hasSeenOnboarding;
}
