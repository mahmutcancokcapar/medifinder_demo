import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_entity.freezed.dart';

enum ProviderType { doctor, clinic, hospital }

@freezed
abstract class ProviderEntity with _$ProviderEntity {
  const factory ProviderEntity({
    required String id,
    required String name,
    required ProviderType type,
    required String specialty,
    required String city,
    required String country,
    required double rating,
    required int reviewCount,
    required List<String> languages,
    required bool isVerified,
    required List<String> tags,
    String? imageUrl,
    String? phone,
    String? email,
    String? website,
    String? bio,
  }) = _ProviderEntity;
}
