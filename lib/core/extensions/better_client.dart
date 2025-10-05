import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension DebounceAndCancelExtension on Ref {
  Future<http.Client> getBetterClient() async {
    final client = http.Client();
    // check if disposed;
    var disposed = false;
    onDispose(() {
      disposed = true;
      client.close();
    });
    if (disposed) {
      throw Exception('Operation cancelled');
    }
    // debounce
    await Future.delayed(const Duration(seconds: 1));

    return client;
  }
}
