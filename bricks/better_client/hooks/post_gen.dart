import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  // add dio package
  final dioProgress = context.logger.progress('Adding Dio Package');
  await Process.run('flutter', ['pub', 'add', 'dio']);
  dioProgress.complete();

  // add flutter_riverpod package
  final riverpodProgress =
      context.logger.progress('Adding Flutter Riverpod Package');
  await Process.run('flutter', ['pub', 'add', 'flutter_riverpod']);
  riverpodProgress.complete();
}
