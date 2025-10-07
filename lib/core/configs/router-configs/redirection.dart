part of 'router.dart';

FutureOr<String?> handleRedirect(
  BuildContext context,
  GoRouterState state,
  Ref ref,
) async {
  final isSignin = state.matchedLocation == RouteNames.signIn;
  final isSignup = state.matchedLocation == RouteNames.signUp;
  final isSplashScreen = state.matchedLocation == RouteNames.splash;
  final isOnboarding = state.matchedLocation == RouteNames.onboarding;

  if (isSignup || isSignin || isOnboarding || isSplashScreen) {
    return null;
  }

  // check if the user has seen the onboarding screen
  final hasSeenOnboarding = await _hasSeenOnboarding();
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

Future<bool> _hasSeenOnboarding() async {
  final sh = await SharedPreferences.getInstance();
  return sh.getBool(hasOnboardingInitialized) ?? false;
}

bool _isAuthenticated(Ref ref) {
  final user = ref
      .read(authProvider)
      .maybeWhen(success: (user) => user, orElse: () => null);
  return user != null;
}
