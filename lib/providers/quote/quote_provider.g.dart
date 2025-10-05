// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchQuote)
const fetchQuoteProvider = FetchQuoteProvider._();

final class FetchQuoteProvider
    extends $FunctionalProvider<AsyncValue<Quote>, Quote, FutureOr<Quote>>
    with $FutureModifier<Quote>, $FutureProvider<Quote> {
  const FetchQuoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchQuoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchQuoteHash();

  @$internal
  @override
  $FutureProviderElement<Quote> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Quote> create(Ref ref) {
    return fetchQuote(ref);
  }
}

String _$fetchQuoteHash() => r'ea3e0080909b0f42352b9d8fd93f89a52e0da87d';
