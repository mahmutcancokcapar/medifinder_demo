import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:medifinder_demo/features/providers/data/repositories/provider_repository_impl.dart';
import 'package:medifinder_demo/features/providers/domain/repositories/provider_repository.dart';
import 'package:medifinder_demo/features/providers/domain/usecases/filter_providers_usecase.dart';
import 'package:medifinder_demo/features/providers/domain/usecases/get_providers_usecase.dart';
import 'package:medifinder_demo/features/providers/domain/usecases/search_providers_usecase.dart';

part 'provider_providers.g.dart';

@riverpod
ProviderRepository providerRepository(ProviderRepositoryRef ref) {
  return const ProviderRepositoryImpl();
}

@riverpod
GetProvidersUsecase getProvidersUsecase(GetProvidersUsecaseRef ref) {
  return GetProvidersUsecase(ref.watch(providerRepositoryProvider));
}

@riverpod
SearchProvidersUsecase searchProvidersUsecase(SearchProvidersUsecaseRef ref) {
  return const SearchProvidersUsecase();
}

@riverpod
FilterProvidersUsecase filterProvidersUsecase(FilterProvidersUsecaseRef ref) {
  return const FilterProvidersUsecase();
}

typedef FilterOptions =
    ({
      List<String> countries,
      List<String> cities,
      List<String> specialties,
    });

@riverpod
Future<FilterOptions> filterOptions(FilterOptionsRef ref) async {
  final providers = await ref.watch(getProvidersUsecaseProvider).call();

  final countries = providers.map((p) => p.country).toSet().toList()..sort();
  final cities = providers.map((p) => p.city).toSet().toList()..sort();
  final specialties =
      providers.map((p) => p.specialty).toSet().toList()..sort();

  return (
    countries: countries,
    cities: cities,
    specialties: specialties,
  );
}
