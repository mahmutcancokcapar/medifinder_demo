import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';

class SearchProvidersUsecase {
  const SearchProvidersUsecase();

  List<ProviderEntity> call(List<ProviderEntity> providers, String query) {
    if (query.trim().isEmpty) return providers;

    final normalized = query.trim().toLowerCase();

    return providers.where((p) {
      return p.name.toLowerCase().contains(normalized) ||
          p.specialty.toLowerCase().contains(normalized) ||
          p.city.toLowerCase().contains(normalized) ||
          p.country.toLowerCase().contains(normalized) ||
          p.tags.any((t) => t.toLowerCase().contains(normalized));
    }).toList();
  }
}
