import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/quote.dart';
import '../data/models/quote_model.dart';
import '../domain/repositories/quote_repo.dart';
import '../../../../core/constants/constants.dart';

part 'quote_service.g.dart';

@Riverpod(keepAlive: true)
QuoteService quoteService(Ref ref) {
  return QuoteService(ref);
}

class QuoteService {
  final Ref ref;
  QuoteService(this.ref);

  Stream<Quote> getQuote() async* {
    final repo = ref.read(quoteRepositoryProvider);
    final lastCachedQuote = await _getLastCachedQuote();
    yield lastCachedQuote;
    final result = await repo.getRandomQuote();
    yield result.fold((error) => throw Exception(error), (quote) {
      _cacheQuote(quote);
      return quote;
    });
  }

  void _cacheQuote(Quote quote) async {
    final sh = await SharedPreferences.getInstance();
    final quoteModel = QuoteModel.fromEntity(quote);
    final encoded = jsonEncode(quoteModel.toJson());
    sh.setString(quotesLocalCacheKey, encoded);
  }

  Future<QuoteModel> _getLastCachedQuote() async {
    final sh = await SharedPreferences.getInstance();
    final lastCachedQuote = sh.getString(quotesLocalCacheKey);
    if (lastCachedQuote == null) {
      return const QuoteModel();
    }
    final decoded = jsonDecode(lastCachedQuote);

    return QuoteModel.fromJson(decoded);
  }
}
