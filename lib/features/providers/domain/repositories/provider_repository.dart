import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';

abstract interface class ProviderRepository {
  Future<List<ProviderEntity>> getProviders();
  Future<ProviderEntity?> getProviderById(String id);
}
