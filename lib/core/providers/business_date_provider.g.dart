// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BusinessDate)
final businessDateProvider = BusinessDateProvider._();

final class BusinessDateProvider
    extends $NotifierProvider<BusinessDate, DateTime> {
  BusinessDateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'businessDateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$businessDateHash();

  @$internal
  @override
  BusinessDate create() => BusinessDate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$businessDateHash() => r'c295257b462fd9976b67c12228eb3a22e02634ce';

abstract class _$BusinessDate extends $Notifier<DateTime> {
  DateTime build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DateTime, DateTime>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime, DateTime>,
              DateTime,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
