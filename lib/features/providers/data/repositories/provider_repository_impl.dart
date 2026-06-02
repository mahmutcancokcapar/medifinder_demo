import 'package:medifinder_demo/features/providers/data/datasources/provider_mock_datasource.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/domain/repositories/provider_repository.dart';

class ProviderRepositoryImpl implements ProviderRepository {
  const ProviderRepositoryImpl();

  @override
  Future<List<ProviderEntity>> getProviders() async {
    final models = await ProviderMockDatasource.getProviders();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<ProviderEntity?> getProviderById(String id) async {
    final model = await ProviderMockDatasource.getProviderById(id);
    return model?.toEntity();
  }
}
