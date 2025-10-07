// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuoteNotifier)
const quoteProvider = QuoteNotifierProvider._();

final class QuoteNotifierProvider
    extends $NotifierProvider<QuoteNotifier, AsyncValue<Quote?>> {
  const QuoteNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quoteProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quoteNotifierHash();

  @$internal
  @override
  QuoteNotifier create() => QuoteNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Quote?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Quote?>>(value),
    );
  }
}

String _$quoteNotifierHash() => r'f5a73bc7b81731d8bbd206bf111537d8bfd3eeb1';

abstract class _$QuoteNotifier extends $Notifier<AsyncValue<Quote?>> {
  AsyncValue<Quote?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Quote?>, AsyncValue<Quote?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Quote?>, AsyncValue<Quote?>>,
              AsyncValue<Quote?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
