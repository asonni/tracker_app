import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class {{screen.pascalCase()}} extends ConsumerStatefulWidget {
  const {{screen.pascalCase()}}({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _{{screen.pascalCase()}}State();
}

class _{{screen.pascalCase()}}State extends ConsumerState<{{screen.pascalCase()}}> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container()
    );
  }
}