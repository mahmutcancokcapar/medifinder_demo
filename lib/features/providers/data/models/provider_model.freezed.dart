// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) {
  return _ProviderModel.fromJson(json);
}

/// @nodoc
mixin _$ProviderModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get specialty => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  List<String> get languages => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;

  /// Serializes this ProviderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProviderModelCopyWith<ProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderModelCopyWith<$Res> {
  factory $ProviderModelCopyWith(
    ProviderModel value,
    $Res Function(ProviderModel) then,
  ) = _$ProviderModelCopyWithImpl<$Res, ProviderModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    String specialty,
    String city,
    String country,
    double rating,
    int reviewCount,
    List<String> languages,
    bool isVerified,
    List<String> tags,
    String? imageUrl,
    String? phone,
    String? email,
    String? website,
    String? bio,
  });
}

/// @nodoc
class _$ProviderModelCopyWithImpl<$Res, $Val extends ProviderModel>
    implements $ProviderModelCopyWith<$Res> {
  _$ProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? specialty = null,
    Object? city = null,
    Object? country = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? languages = null,
    Object? isVerified = null,
    Object? tags = null,
    Object? imageUrl = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? bio = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            specialty:
                null == specialty
                    ? _value.specialty
                    : specialty // ignore: cast_nullable_to_non_nullable
                        as String,
            city:
                null == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String,
            country:
                null == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as String,
            rating:
                null == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double,
            reviewCount:
                null == reviewCount
                    ? _value.reviewCount
                    : reviewCount // ignore: cast_nullable_to_non_nullable
                        as int,
            languages:
                null == languages
                    ? _value.languages
                    : languages // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            isVerified:
                null == isVerified
                    ? _value.isVerified
                    : isVerified // ignore: cast_nullable_to_non_nullable
                        as bool,
            tags:
                null == tags
                    ? _value.tags
                    : tags // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            phone:
                freezed == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            website:
                freezed == website
                    ? _value.website
                    : website // ignore: cast_nullable_to_non_nullable
                        as String?,
            bio:
                freezed == bio
                    ? _value.bio
                    : bio // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProviderModelImplCopyWith<$Res>
    implements $ProviderModelCopyWith<$Res> {
  factory _$$ProviderModelImplCopyWith(
    _$ProviderModelImpl value,
    $Res Function(_$ProviderModelImpl) then,
  ) = __$$ProviderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    String specialty,
    String city,
    String country,
    double rating,
    int reviewCount,
    List<String> languages,
    bool isVerified,
    List<String> tags,
    String? imageUrl,
    String? phone,
    String? email,
    String? website,
    String? bio,
  });
}

/// @nodoc
class __$$ProviderModelImplCopyWithImpl<$Res>
    extends _$ProviderModelCopyWithImpl<$Res, _$ProviderModelImpl>
    implements _$$ProviderModelImplCopyWith<$Res> {
  __$$ProviderModelImplCopyWithImpl(
    _$ProviderModelImpl _value,
    $Res Function(_$ProviderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? specialty = null,
    Object? city = null,
    Object? country = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? languages = null,
    Object? isVerified = null,
    Object? tags = null,
    Object? imageUrl = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? bio = freezed,
  }) {
    return _then(
      _$ProviderModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        specialty:
            null == specialty
                ? _value.specialty
                : specialty // ignore: cast_nullable_to_non_nullable
                    as String,
        city:
            null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String,
        country:
            null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String,
        rating:
            null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double,
        reviewCount:
            null == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        isVerified:
            null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                    as bool,
        tags:
            null == tags
                ? _value._tags
                : tags // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        phone:
            freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        website:
            freezed == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                    as String?,
        bio:
            freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderModelImpl extends _ProviderModel {
  const _$ProviderModelImpl({
    required this.id,
    required this.name,
    required this.type,
    required this.specialty,
    required this.city,
    required this.country,
    required this.rating,
    required this.reviewCount,
    required final List<String> languages,
    required this.isVerified,
    required final List<String> tags,
    this.imageUrl,
    this.phone,
    this.email,
    this.website,
    this.bio,
  }) : _languages = languages,
       _tags = tags,
       super._();

  factory _$ProviderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String specialty;
  @override
  final String city;
  @override
  final String country;
  @override
  final double rating;
  @override
  final int reviewCount;
  final List<String> _languages;
  @override
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final bool isVerified;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? imageUrl;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? website;
  @override
  final String? bio;

  @override
  String toString() {
    return 'ProviderModel(id: $id, name: $name, type: $type, specialty: $specialty, city: $city, country: $country, rating: $rating, reviewCount: $reviewCount, languages: $languages, isVerified: $isVerified, tags: $tags, imageUrl: $imageUrl, phone: $phone, email: $email, website: $website, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    specialty,
    city,
    country,
    rating,
    reviewCount,
    const DeepCollectionEquality().hash(_languages),
    isVerified,
    const DeepCollectionEquality().hash(_tags),
    imageUrl,
    phone,
    email,
    website,
    bio,
  );

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderModelImplCopyWith<_$ProviderModelImpl> get copyWith =>
      __$$ProviderModelImplCopyWithImpl<_$ProviderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderModelImplToJson(this);
  }
}

abstract class _ProviderModel extends ProviderModel {
  const factory _ProviderModel({
    required final String id,
    required final String name,
    required final String type,
    required final String specialty,
    required final String city,
    required final String country,
    required final double rating,
    required final int reviewCount,
    required final List<String> languages,
    required final bool isVerified,
    required final List<String> tags,
    final String? imageUrl,
    final String? phone,
    final String? email,
    final String? website,
    final String? bio,
  }) = _$ProviderModelImpl;
  const _ProviderModel._() : super._();

  factory _ProviderModel.fromJson(Map<String, dynamic> json) =
      _$ProviderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get specialty;
  @override
  String get city;
  @override
  String get country;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  List<String> get languages;
  @override
  bool get isVerified;
  @override
  List<String> get tags;
  @override
  String? get imageUrl;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get website;
  @override
  String? get bio;

  /// Create a copy of ProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProviderModelImplCopyWith<_$ProviderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
