// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(workoutDataSource)
const workoutDataSourceProvider = WorkoutDataSourceProvider._();

final class WorkoutDataSourceProvider
    extends
        $FunctionalProvider<
          WorkoutDataSource,
          WorkoutDataSource,
          WorkoutDataSource
        >
    with $Provider<WorkoutDataSource> {
  const WorkoutDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutDataSourceHash();

  @$internal
  @override
  $ProviderElement<WorkoutDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WorkoutDataSource create(Ref ref) {
    return workoutDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutDataSource>(value),
    );
  }
}

String _$workoutDataSourceHash() => r'e42c56c957d3b406e312f8de44fbd97bd32761e0';
