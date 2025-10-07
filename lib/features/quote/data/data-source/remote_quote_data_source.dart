import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'quote_data_source.dart';
import '../models/quote_model.dart';
import '../../../../core/extensions/better_client.dart';

class RemoteQuoteDataSource implements QuoteDataSource {
  final Ref ref;

  RemoteQuoteDataSource({required this.ref});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final dio = await ref.getBetterClient();
    final response = await dio.get<Map<String, dynamic>>(
      'https://quotes-api-self.vercel.app/quote',
      options: Options(responseType: ResponseType.json),
    );

    final data = response.data;
    if (response.statusCode == 200 && data != null) {
      return QuoteModel.fromJson(data);
    } else {
      throw Exception(
        'Failed to load quote: ${response.statusMessage ?? 'Unknown error'}',
      );
    }
  }
}
