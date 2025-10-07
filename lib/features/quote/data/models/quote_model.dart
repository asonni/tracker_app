import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quote.dart';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

@freezed
abstract class QuoteModel with _$QuoteModel implements Quote {
  const factory QuoteModel({String? id, String? quote, String? author}) =
      _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  factory QuoteModel.fromEntity(Quote quote) =>
      QuoteModel(id: quote.id, quote: quote.quote, author: quote.author);
}
