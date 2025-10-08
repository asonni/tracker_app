import 'app.dart';
import 'core/configs/flavor_config.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flavorConfigProvider = Provider<FlavorConfig>((ref) {
  throw UnimplementedError();
});

void mainCommon(FlavorConfig flavorConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(
    ProviderScope(
      overrides: [flavorConfigProvider.overrideWithValue(flavorConfig)],
      child: const MyApp(),
    ),
  );
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
