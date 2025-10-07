import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension DebounceAndCancelExtension on Ref {
  Future<Dio> getBetterClient({BaseOptions? options}) async {
    final dio = Dio(options);
    var disposed = false;
    onDispose(() {
      disposed = true;
      dio.close(force: true);
    });

    if (disposed) {
      throw Exception('Client disposed');
    }

    await Future.delayed(const Duration(seconds: 1));

    return dio;
  }
}
