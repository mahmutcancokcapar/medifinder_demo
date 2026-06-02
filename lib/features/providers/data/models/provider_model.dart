import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';

part 'provider_model.freezed.dart';
part 'provider_model.g.dart';

@freezed
abstract class ProviderModel with _$ProviderModel {
  const factory ProviderModel({
    required String id,
    required String name,
    required String type,
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
  }) = _ProviderModel;

  const ProviderModel._();

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);

  ProviderEntity toEntity() => ProviderEntity(
    id: id,
    name: name,
    type: _parseType(type),
    specialty: specialty,
    city: city,
    country: country,
    rating: rating,
    reviewCount: reviewCount,
    languages: languages,
    isVerified: isVerified,
    tags: tags,
    imageUrl: imageUrl,
    phone: phone,
    email: email,
    website: website,
    bio: bio,
  );

  static ProviderType _parseType(String raw) => switch (raw) {
    'clinic' => ProviderType.clinic,
    'hospital' => ProviderType.hospital,
    _ => ProviderType.doctor,
  };
}
