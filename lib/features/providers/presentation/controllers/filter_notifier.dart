import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:medifinder_demo/features/providers/domain/entities/filter_entity.dart';

part 'filter_notifier.g.dart';

@riverpod
class FilterNotifier extends _$FilterNotifier {
  @override
  FilterEntity build() => FilterEntity.empty();

  void toggleCountry(String country) {
    final current = state.selectedCountries;
    state = state.copyWith(
      selectedCountries:
          current.contains(country)
              ? current.where((c) => c != country).toList()
              : [...current, country],
    );
  }

  void toggleCity(String city) {
    final current = state.selectedCities;
    state = state.copyWith(
      selectedCities:
          current.contains(city)
              ? current.where((c) => c != city).toList()
              : [...current, city],
    );
  }

  void toggleSpecialty(String specialty) {
    final current = state.selectedSpecialties;
    state = state.copyWith(
      selectedSpecialties:
          current.contains(specialty)
              ? current.where((s) => s != specialty).toList()
              : [...current, specialty],
    );
  }

  void clearAll() => state = FilterEntity.empty();

  void applyFilter(FilterEntity filter) => state = filter;
}
