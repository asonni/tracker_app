import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/quote.dart';
import '../../../application/quote_service.dart';

part 'quote_provider.g.dart';

@Riverpod(keepAlive: true)
class QuoteNotifier extends _$QuoteNotifier {
  @override
  AsyncValue<Quote?> build() {
    _loadQuote();
    return const AsyncLoading();
  }

  void _loadQuote() {
    final quoteService = ref.read(quoteServiceProvider);
    quoteService.getQuote().listen((data) {
      state = AsyncData(data);
    });
  }
}
