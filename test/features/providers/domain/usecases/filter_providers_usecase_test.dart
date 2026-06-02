import 'package:flutter_test/flutter_test.dart';

import 'package:medifinder_demo/features/providers/domain/entities/filter_entity.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/domain/usecases/filter_providers_usecase.dart';

void main() {
  late FilterProvidersUsecase usecase;

  setUp(() {
    usecase = const FilterProvidersUsecase();
  });

  final providers = <ProviderEntity>[
    const ProviderEntity(
      id: '1',
      name: 'Dr. John Doe',
      type: ProviderType.doctor,
      specialty: 'Cardiology',
      city: 'Istanbul',
      country: 'Turkey',
      rating: 4.8,
      reviewCount: 100,
      languages: ['Turkish'],
      isVerified: true,
      tags: [],
    ),
    const ProviderEntity(
      id: '2',
      name: 'Dr. Jane Smith',
      type: ProviderType.doctor,
      specialty: 'Dermatology',
      city: 'London',
      country: 'UK',
      rating: 4.5,
      reviewCount: 50,
      languages: ['English'],
      isVerified: false,
      tags: [],
    ),
    const ProviderEntity(
      id: '3',
      name: 'Dr. Ali Veli',
      type: ProviderType.doctor,
      specialty: 'Cardiology',
      city: 'Ankara',
      country: 'Turkey',
      rating: 4.9,
      reviewCount: 200,
      languages: ['Turkish'],
      isVerified: true,
      tags: [],
    ),
  ];

  test('should return all providers when filter is empty', () {
    final result = usecase(providers, FilterEntity.empty());
    expect(result.length, 3);
  });

  test('should filter by country', () {
    final filter = FilterEntity.empty().copyWith(selectedCountries: ['Turkey']);
    final result = usecase(providers, filter);
    expect(result.length, 2);
    expect(result.every((p) => p.country == 'Turkey'), true);
  });

  test('should filter by city', () {
    final filter = FilterEntity.empty().copyWith(selectedCities: ['London']);
    final result = usecase(providers, filter);
    expect(result.length, 1);
    expect(result.first.city, 'London');
  });

  test('should filter by specialty', () {
    final filter = FilterEntity.empty().copyWith(
      selectedSpecialties: ['Cardiology'],
    );
    final result = usecase(providers, filter);
    expect(result.length, 2);
    expect(result.every((p) => p.specialty == 'Cardiology'), true);
  });

  test('should apply multiple filters (AND logic)', () {
    final filter = FilterEntity.empty().copyWith(
      selectedCountries: ['Turkey'],
      selectedCities: ['Istanbul'],
      selectedSpecialties: ['Cardiology'],
    );
    final result = usecase(providers, filter);
    expect(result.length, 1);
    expect(result.first.name, 'Dr. John Doe');
  });
}
