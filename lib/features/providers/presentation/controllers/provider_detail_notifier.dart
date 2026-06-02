import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';
import 'package:medifinder_demo/features/providers/presentation/controllers/provider_providers.dart';

part 'provider_detail_notifier.g.dart';

@riverpod
class ProviderDetailNotifier extends _$ProviderDetailNotifier {
  @override
  Future<ProviderEntity?> build(String id) async {
    final repo = ref.watch(providerRepositoryProvider);
    return repo.getProviderById(id);
  }
}
