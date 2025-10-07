// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quoteRepository)
const quoteRepositoryProvider = QuoteRepositoryProvider._();

final class QuoteRepositoryProvider
    extends $FunctionalProvider<QuoteRepo, QuoteRepo, QuoteRepo>
    with $Provider<QuoteRepo> {
  const QuoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<QuoteRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuoteRepo create(Ref ref) {
    return quoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuoteRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuoteRepo>(value),
    );
  }
}

String _$quoteRepositoryHash() => r'18936b923bb50530cf4f1bc8f822a22b7f0d3578';
