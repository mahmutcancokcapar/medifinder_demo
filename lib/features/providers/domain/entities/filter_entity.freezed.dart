// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterEntity {
  List<String> get selectedCountries => throw _privateConstructorUsedError;
  List<String> get selectedCities => throw _privateConstructorUsedError;
  List<String> get selectedSpecialties => throw _privateConstructorUsedError;

  /// Create a copy of FilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterEntityCopyWith<FilterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterEntityCopyWith<$Res> {
  factory $FilterEntityCopyWith(
    FilterEntity value,
    $Res Function(FilterEntity) then,
  ) = _$FilterEntityCopyWithImpl<$Res, FilterEntity>;
  @useResult
  $Res call({
    List<String> selectedCountries,
    List<String> selectedCities,
    List<String> selectedSpecialties,
  });
}

/// @nodoc
class _$FilterEntityCopyWithImpl<$Res, $Val extends FilterEntity>
    implements $FilterEntityCopyWith<$Res> {
  _$FilterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCountries = null,
    Object? selectedCities = null,
    Object? selectedSpecialties = null,
  }) {
    return _then(
      _value.copyWith(
            selectedCountries:
                null == selectedCountries
                    ? _value.selectedCountries
                    : selectedCountries // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            selectedCities:
                null == selectedCities
                    ? _value.selectedCities
                    : selectedCities // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            selectedSpecialties:
                null == selectedSpecialties
                    ? _value.selectedSpecialties
                    : selectedSpecialties // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterEntityImplCopyWith<$Res>
    implements $FilterEntityCopyWith<$Res> {
  factory _$$FilterEntityImplCopyWith(
    _$FilterEntityImpl value,
    $Res Function(_$FilterEntityImpl) then,
  ) = __$$FilterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> selectedCountries,
    List<String> selectedCities,
    List<String> selectedSpecialties,
  });
}

/// @nodoc
class __$$FilterEntityImplCopyWithImpl<$Res>
    extends _$FilterEntityCopyWithImpl<$Res, _$FilterEntityImpl>
    implements _$$FilterEntityImplCopyWith<$Res> {
  __$$FilterEntityImplCopyWithImpl(
    _$FilterEntityImpl _value,
    $Res Function(_$FilterEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCountries = null,
    Object? selectedCities = null,
    Object? selectedSpecialties = null,
  }) {
    return _then(
      _$FilterEntityImpl(
        selectedCountries:
            null == selectedCountries
                ? _value._selectedCountries
                : selectedCountries // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        selectedCities:
            null == selectedCities
                ? _value._selectedCities
                : selectedCities // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        selectedSpecialties:
            null == selectedSpecialties
                ? _value._selectedSpecialties
                : selectedSpecialties // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$FilterEntityImpl extends _FilterEntity {
  const _$FilterEntityImpl({
    final List<String> selectedCountries = const [],
    final List<String> selectedCities = const [],
    final List<String> selectedSpecialties = const [],
  }) : _selectedCountries = selectedCountries,
       _selectedCities = selectedCities,
       _selectedSpecialties = selectedSpecialties,
       super._();

  final List<String> _selectedCountries;
  @override
  @JsonKey()
  List<String> get selectedCountries {
    if (_selectedCountries is EqualUnmodifiableListView)
      return _selectedCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCountries);
  }

  final List<String> _selectedCities;
  @override
  @JsonKey()
  List<String> get selectedCities {
    if (_selectedCities is EqualUnmodifiableListView) return _selectedCities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCities);
  }

  final List<String> _selectedSpecialties;
  @override
  @JsonKey()
  List<String> get selectedSpecialties {
    if (_selectedSpecialties is EqualUnmodifiableListView)
      return _selectedSpecialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSpecialties);
  }

  @override
  String toString() {
    return 'FilterEntity(selectedCountries: $selectedCountries, selectedCities: $selectedCities, selectedSpecialties: $selectedSpecialties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterEntityImpl &&
            const DeepCollectionEquality().equals(
              other._selectedCountries,
              _selectedCountries,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedCities,
              _selectedCities,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedSpecialties,
              _selectedSpecialties,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_selectedCountries),
    const DeepCollectionEquality().hash(_selectedCities),
    const DeepCollectionEquality().hash(_selectedSpecialties),
  );

  /// Create a copy of FilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterEntityImplCopyWith<_$FilterEntityImpl> get copyWith =>
      __$$FilterEntityImplCopyWithImpl<_$FilterEntityImpl>(this, _$identity);
}

abstract class _FilterEntity extends FilterEntity {
  const factory _FilterEntity({
    final List<String> selectedCountries,
    final List<String> selectedCities,
    final List<String> selectedSpecialties,
  }) = _$FilterEntityImpl;
  const _FilterEntity._() : super._();

  @override
  List<String> get selectedCountries;
  @override
  List<String> get selectedCities;
  @override
  List<String> get selectedSpecialties;

  /// Create a copy of FilterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterEntityImplCopyWith<_$FilterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
