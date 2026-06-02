import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/domain/repositories/provider_repository.dart';

class GetProvidersUsecase {
  const GetProvidersUsecase(this._repository);

  final ProviderRepository _repository;

  Future<List<ProviderEntity>> call() => _repository.getProviders();
}
