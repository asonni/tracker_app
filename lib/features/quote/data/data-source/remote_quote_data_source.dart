import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'quote_data_source.dart';
import '../models/quote_model.dart';
import '../../../../core/extensions/better_client.dart';

class RemoteQuoteDataSource implements QuoteDataSource {
  final Ref ref;

  RemoteQuoteDataSource({required this.ref});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final client = await ref.getBetterClient();
    final response = await client.get(
      Uri.parse('https://quotes-api-self.vercel.app/quote'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return QuoteModel.fromJson(data);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
