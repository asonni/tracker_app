part of 'router.dart';

FutureOr<String?> handleRedirect(
  BuildContext context,
  GoRouterState state,
  Ref ref,
) {
  final isSignin = state.matchedLocation == RouteNames.signIn;
  final isSignup = state.matchedLocation == RouteNames.signUp;
  final isSplashScreen = state.matchedLocation == RouteNames.splash;
  final isOnboarding = state.matchedLocation == RouteNames.onboarding;

  if (isSignup || isSignin || isOnboarding || isSplashScreen) {
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

bool _hasSeenOnboarding(Ref ref) {
  final hasSeenOnboarding = ref.read(hasSeenOnboardingProvider);
  return hasSeenOnboarding;
}

bool _isAuthenticated(Ref ref) {
  final user = ref
      .read(authProvider)
      .maybeWhen(success: (user) => user, orElse: () => null);
  return user != null;
}
