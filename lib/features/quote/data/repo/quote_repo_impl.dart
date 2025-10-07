import 'package:dartz/dartz.dart';

import '../data-source/quote_data_source.dart';
import '../../domain/entities/quote.dart';
import '../../domain/repositories/quote_repo.dart';
import '../../../../core/handlers/error-handler/error_handler.dart';

class QuoteRepoImpl implements QuoteRepo {
  final QuoteDataSource quoteDataSource;

  QuoteRepoImpl({required this.quoteDataSource});

  @override
  Future<Either<String, Quote>> getRandomQuote() async {
    try {
      final quote = await quoteDataSource.getRandomQuote();
      return Right(quote);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
