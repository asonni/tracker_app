// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(workoutRepository)
const workoutRepositoryProvider = WorkoutRepositoryProvider._();

final class WorkoutRepositoryProvider
    extends $FunctionalProvider<WorkoutRepo, WorkoutRepo, WorkoutRepo>
    with $Provider<WorkoutRepo> {
  const WorkoutRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutRepositoryHash();

  @$internal
  @override
  $ProviderElement<WorkoutRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WorkoutRepo create(Ref ref) {
    return workoutRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutRepo>(value),
    );
  }
}

String _$workoutRepositoryHash() => r'd2deee6629662e3837481ab165866772296ea844';
