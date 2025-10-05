import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/configs/router-configs/router.dart';
import 'core/constants.dart';

// import 'screens/main_screen.dart';
// import 'screens/sign_in_screen.dart';
// import 'screens/sign_up_screen.dart';
// import 'screens/onboarding_screen.dart';

// import 'providers/auth/auth_provider.dart';
import 'providers/onboarding/onboarding_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sh = await SharedPreferences.getInstance();
  final hasSeenOnboarding = sh.getBool(hasSeenOnboardingInitialized) ?? false;

  runApp(
    ProviderScope(
      overrides: [
        hasSeenOnboardingProvider.overrideWith((ref) => hasSeenOnboarding),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final hasSeenOnboarding = ref.read(hasSeenOnboardingProvider);
    // final user = ref.watch(authProvider);
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.white70,
          surface: Color(0xFF1A237E),
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A237E),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xFF0D1344),
        cardTheme: CardThemeData(
          color: const Color(0xFF1A237E),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        tabBarTheme: const TabBarThemeData(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1A237E),
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.white.withValues(alpha: 0.1),
          backgroundColor: const Color(0xFF1A237E),
        ),
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      // home: hasSeenOnboarding
      //     ? (user?.isAuthenticated == true
      //           ? const MainScreen()
      //           : const SignInScreen())
      //     : const OnboardingScreen(),
    );
  }
}
