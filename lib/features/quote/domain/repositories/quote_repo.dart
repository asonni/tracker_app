import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/quote.dart';
import '../../data/repo/quote_repo_impl.dart';
import '../../data/data-source/quote_data_source.dart';

part 'quote_repo.g.dart';

@Riverpod(keepAlive: true)
QuoteRepo quoteRepository(Ref ref) {
  return QuoteRepoImpl(quoteDataSource: ref.read(quoteDataSourceProvider));
}

abstract class QuoteRepo {
  Future<Either<String, Quote>> getRandomQuote();
}
