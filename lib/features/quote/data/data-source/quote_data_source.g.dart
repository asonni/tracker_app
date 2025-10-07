// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quoteDataSource)
const quoteDataSourceProvider = QuoteDataSourceProvider._();

final class QuoteDataSourceProvider
    extends
        $FunctionalProvider<QuoteDataSource, QuoteDataSource, QuoteDataSource>
    with $Provider<QuoteDataSource> {
  const QuoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<QuoteDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuoteDataSource create(Ref ref) {
    return quoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuoteDataSource>(value),
    );
  }
}

String _$quoteDataSourceHash() => r'33437d248f70b25e35e8095b80c821b3146ede08';
