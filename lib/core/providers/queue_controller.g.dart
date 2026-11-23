// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QueueController)
final queueControllerProvider = QueueControllerProvider._();

final class QueueControllerProvider
    extends $AsyncNotifierProvider<QueueController, void> {
  QueueControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueControllerHash();

  @$internal
  @override
  QueueController create() => QueueController();
}

String _$queueControllerHash() => r'37d892d54637aa05f607e342743af936889e2a24';

abstract class _$QueueController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
