// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quoteService)
const quoteServiceProvider = QuoteServiceProvider._();

final class QuoteServiceProvider
    extends $FunctionalProvider<QuoteService, QuoteService, QuoteService>
    with $Provider<QuoteService> {
  const QuoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quoteServiceHash();

  @$internal
  @override
  $ProviderElement<QuoteService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuoteService create(Ref ref) {
    return quoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuoteService>(value),
    );
  }
}

String _$quoteServiceHash() => r'5f9a4f0f7b2bc96c3c708229986dfd49e34c482b';
