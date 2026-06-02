// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchQueryHash() => r'7025e359cd02f38f6320640581424352d023d8dc';

/// See also [searchQuery].
@ProviderFor(searchQuery)
final searchQueryProvider = AutoDisposeProvider<String>.internal(
  searchQuery,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchQueryRef = AutoDisposeProviderRef<String>;
String _$providerListNotifierHash() =>
    r'c6d070403a7df60bac7355e9a6084be15a6a58a2';

/// See also [ProviderListNotifier].
@ProviderFor(ProviderListNotifier)
final providerListNotifierProvider = AutoDisposeAsyncNotifierProvider<
  ProviderListNotifier,
  List<ProviderEntity>
>.internal(
  ProviderListNotifier.new,
  name: r'providerListNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$providerListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProviderListNotifier = AutoDisposeAsyncNotifier<List<ProviderEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
