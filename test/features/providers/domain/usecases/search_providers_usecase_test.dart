import 'package:flutter_test/flutter_test.dart';

import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/domain/usecases/search_providers_usecase.dart';

void main() {
  late SearchProvidersUsecase usecase;

  setUp(() {
    usecase = const SearchProvidersUsecase();
  });

  final providers = <ProviderEntity>[
    const ProviderEntity(
      id: '1',
      name: 'Dr. Gregory House',
      type: ProviderType.doctor,
      specialty: 'Diagnostician',
      city: 'Princeton',
      country: 'USA',
      rating: 4.8,
      reviewCount: 150,
      languages: ['English'],
      isVerified: true,
      tags: [],
    ),
    const ProviderEntity(
      id: '2',
      name: 'Dr. James Wilson',
      type: ProviderType.doctor,
      specialty: 'Oncology',
      city: 'Princeton',
      country: 'USA',
      rating: 4.9,
      reviewCount: 89,
      languages: ['English'],
      isVerified: true,
      tags: [],
    ),
  ];

  test('should return all providers when query is empty', () {
    final result = usecase(providers, '');
    expect(result.length, 2);
  });

  test('should return empty list when no match is found', () {
    final result = usecase(providers, 'Nonexistent');
    expect(result.isEmpty, true);
  });

  test('should filter providers by name (case-insensitive)', () {
    final result = usecase(providers, 'house');
    expect(result.length, 1);
    expect(result.first.name, 'Dr. Gregory House');
  });

  test('should filter providers by specialty (case-insensitive)', () {
    final result = usecase(providers, 'onco');
    expect(result.length, 1);
    expect(result.first.specialty, 'Oncology');
  });
}
