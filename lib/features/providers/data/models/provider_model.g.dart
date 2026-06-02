// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderModelImpl _$$ProviderModelImplFromJson(Map<String, dynamic> json) =>
    _$ProviderModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      specialty: json['specialty'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      isVerified: json['isVerified'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$ProviderModelImplToJson(_$ProviderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'specialty': instance.specialty,
      'city': instance.city,
      'country': instance.country,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'languages': instance.languages,
      'isVerified': instance.isVerified,
      'tags': instance.tags,
      'imageUrl': instance.imageUrl,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'bio': instance.bio,
    };
