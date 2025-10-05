import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/extensions/better_client.dart';
import '../../data/models/quote/quote.dart';

part 'quote_provider.g.dart';

@riverpod
Future<Quote> fetchQuote(Ref ref) async {
  final url = Uri.parse('https://quotes-api-self.vercel.app/quote');
  final client = await ref.getBetterClient();

  final response = await client.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to load quote');
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;

  return Quote.fromJson(body);
}
