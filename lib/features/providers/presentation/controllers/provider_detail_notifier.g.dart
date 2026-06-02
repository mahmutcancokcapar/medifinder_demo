// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$providerDetailNotifierHash() =>
    r'c95d173e6968ffa7c52f2eda2c945352a4dedc74';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProviderDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ProviderEntity?> {
  late final String id;

  FutureOr<ProviderEntity?> build(String id);
}

/// See also [ProviderDetailNotifier].
@ProviderFor(ProviderDetailNotifier)
const providerDetailNotifierProvider = ProviderDetailNotifierFamily();

/// See also [ProviderDetailNotifier].
class ProviderDetailNotifierFamily extends Family<AsyncValue<ProviderEntity?>> {
  /// See also [ProviderDetailNotifier].
  const ProviderDetailNotifierFamily();

  /// See also [ProviderDetailNotifier].
  ProviderDetailNotifierProvider call(String id) {
    return ProviderDetailNotifierProvider(id);
  }

  @override
  ProviderDetailNotifierProvider getProviderOverride(
    covariant ProviderDetailNotifierProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'providerDetailNotifierProvider';
}

/// See also [ProviderDetailNotifier].
class ProviderDetailNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProviderDetailNotifier,
          ProviderEntity?
        > {
  /// See also [ProviderDetailNotifier].
  ProviderDetailNotifierProvider(String id)
    : this._internal(
        () => ProviderDetailNotifier()..id = id,
        from: providerDetailNotifierProvider,
        name: r'providerDetailNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$providerDetailNotifierHash,
        dependencies: ProviderDetailNotifierFamily._dependencies,
        allTransitiveDependencies:
            ProviderDetailNotifierFamily._allTransitiveDependencies,
        id: id,
      );

  ProviderDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<ProviderEntity?> runNotifierBuild(
    covariant ProviderDetailNotifier notifier,
  ) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(ProviderDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProviderDetailNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    ProviderDetailNotifier,
    ProviderEntity?
  >
  createElement() {
    return _ProviderDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProviderDetailNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProviderDetailNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ProviderEntity?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProviderDetailNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProviderDetailNotifier,
          ProviderEntity?
        >
    with ProviderDetailNotifierRef {
  _ProviderDetailNotifierProviderElement(super.provider);

  @override
  String get id => (origin as ProviderDetailNotifierProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
