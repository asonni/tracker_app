import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/quote_model.dart';
import 'remote_quote_data_source.dart';

part 'quote_data_source.g.dart';

@Riverpod(keepAlive: true)
QuoteDataSource quoteDataSource(Ref ref) {
  return RemoteQuoteDataSource(ref: ref);
}

abstract class QuoteDataSource {
  Future<QuoteModel> getRandomQuote();
}
