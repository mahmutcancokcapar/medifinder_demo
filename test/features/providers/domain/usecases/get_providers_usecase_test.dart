import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/domain/repositories/provider_repository.dart';
import 'package:medifinder_demo/features/providers/domain/usecases/get_providers_usecase.dart';

class MockProviderRepository extends Mock implements ProviderRepository {}

void main() {
  late GetProvidersUsecase usecase;
  late MockProviderRepository mockRepository;

  setUp(() {
    mockRepository = MockProviderRepository();
    usecase = GetProvidersUsecase(mockRepository);
  });

  final mockProviders = <ProviderEntity>[
    const ProviderEntity(
      id: '1',
      name: 'Dr. Test',
      type: ProviderType.doctor,
      specialty: 'Test',
      city: 'Test',
      country: 'Test',
      rating: 5,
      reviewCount: 1,
      languages: ['English'],
      isVerified: true,
      tags: [],
    ),
  ];

  test('should get providers from the repository', () async {
    // arrange
    when(() => mockRepository.getProviders())
        .thenAnswer((_) async => mockProviders);

    // act
    final result = await usecase();

    // assert
    expect(result, mockProviders);
    verify(() => mockRepository.getProviders()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
