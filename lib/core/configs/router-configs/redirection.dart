part of 'router.dart';

FutureOr<String?> handleRedirect(
  BuildContext context,
  GoRouterState state,
  Ref ref,
) {
  final isSignin = state.matchedLocation == "/sign-in";
  final isSignup = state.matchedLocation == "/sign-up";
  final isOnboarding = state.matchedLocation == "/onboarding";

  if (isSignup || isSignin || isOnboarding) {
    return null;
  }

  // check if the user has seen the onboarding screen
  final hasSeenOnboarding = _hasSeenOnboarding(ref);
  if (!hasSeenOnboarding) {
    return "/onboarding";
  }
  // check if the user is logged in or not
  final isAuthenticated = _isAuthenticated(ref);
  if (!isAuthenticated) {
    return "/sign-in";
  }

  return null;
}

bool _hasSeenOnboarding(Ref ref) {
  final hasSeenOnboarding = ref.watch(hasSeenOnboardingProvider);
  return hasSeenOnboarding;
}

bool _isAuthenticated(Ref ref) {
  final user = ref.watch(authProvider);
  return user?.isAuthenticated == true;
}
