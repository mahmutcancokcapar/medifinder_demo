import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/filter_notifier.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/provider_providers.dart';

part 'provider_list_notifier.g.dart';

@riverpod
class ProviderListNotifier extends _$ProviderListNotifier {
  List<ProviderEntity> _allProviders = [];
  String _searchQuery = '';

  @override
  Future<List<ProviderEntity>> build() async {
    _allProviders = await ref.watch(getProvidersUsecaseProvider).call();
    return _applyFilters();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      _allProviders = await ref.read(getProvidersUsecaseProvider).call();
      return _applyFilters();
    });
  }

  void onSearchChanged(String query) {
    _searchQuery = query;
    _updateState();
  }

  void invalidateFilters() => _updateState();

  void _updateState() {
    if (state is AsyncData) {
      state = AsyncData(_applyFilters());
    }
  }

  List<ProviderEntity> _applyFilters() {
    final filter = ref.read(filterNotifierProvider);
    final search = ref.read(searchProvidersUsecaseProvider);
    final filterUsecase = ref.read(filterProvidersUsecaseProvider);

    final searched = search(_allProviders, _searchQuery);
    return filterUsecase(searched, filter);
  }
}

@riverpod
String searchQuery(SearchQueryRef ref) => '';
