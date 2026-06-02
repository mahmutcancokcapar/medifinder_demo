import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_entity.freezed.dart';

@freezed
abstract class FilterEntity with _$FilterEntity {
  const factory FilterEntity({
    @Default([]) List<String> selectedCountries,
    @Default([]) List<String> selectedCities,
    @Default([]) List<String> selectedSpecialties,
  }) = _FilterEntity;

  const FilterEntity._();

  factory FilterEntity.empty() => const FilterEntity();

  int get activeCount =>
      selectedCountries.length +
      selectedCities.length +
      selectedSpecialties.length;

  bool get isEmpty => activeCount == 0;
}
