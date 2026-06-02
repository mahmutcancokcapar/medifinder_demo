import 'package:medifinder_demo/features/providers/domain/entities/filter_entity.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';

class FilterProvidersUsecase {
  const FilterProvidersUsecase();

  List<ProviderEntity> call(
    List<ProviderEntity> providers,
    FilterEntity filter,
  ) {
    if (filter.isEmpty) return providers;

    return providers.where((p) {
      final countryMatch =
          filter.selectedCountries.isEmpty ||
          filter.selectedCountries.contains(p.country);

      final cityMatch =
          filter.selectedCities.isEmpty ||
          filter.selectedCities.contains(p.city);

      final specialtyMatch =
          filter.selectedSpecialties.isEmpty ||
          filter.selectedSpecialties.contains(p.specialty);

      return countryMatch && cityMatch && specialtyMatch;
    }).toList();
  }
}
