// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'character_filter_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CharacterFilterOptionsTearOff {
  const _$CharacterFilterOptionsTearOff();

  _CharacterFilterOptions call(
      {required String name,
      required String status,
      required String species,
      required String type,
      required String gender}) {
    return _CharacterFilterOptions(
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
    );
  }
}

/// @nodoc
const $CharacterFilterOptions = _$CharacterFilterOptionsTearOff();

/// @nodoc
mixin _$CharacterFilterOptions {
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterFilterOptionsCopyWith<CharacterFilterOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterFilterOptionsCopyWith<$Res> {
  factory $CharacterFilterOptionsCopyWith(CharacterFilterOptions value,
          $Res Function(CharacterFilterOptions) then) =
      _$CharacterFilterOptionsCopyWithImpl<$Res>;
  $Res call(
      {String name, String status, String species, String type, String gender});
}

/// @nodoc
class _$CharacterFilterOptionsCopyWithImpl<$Res>
    implements $CharacterFilterOptionsCopyWith<$Res> {
  _$CharacterFilterOptionsCopyWithImpl(this._value, this._then);

  final CharacterFilterOptions _value;
  // ignore: unused_field
  final $Res Function(CharacterFilterOptions) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CharacterFilterOptionsCopyWith<$Res>
    implements $CharacterFilterOptionsCopyWith<$Res> {
  factory _$CharacterFilterOptionsCopyWith(_CharacterFilterOptions value,
          $Res Function(_CharacterFilterOptions) then) =
      __$CharacterFilterOptionsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name, String status, String species, String type, String gender});
}

/// @nodoc
class __$CharacterFilterOptionsCopyWithImpl<$Res>
    extends _$CharacterFilterOptionsCopyWithImpl<$Res>
    implements _$CharacterFilterOptionsCopyWith<$Res> {
  __$CharacterFilterOptionsCopyWithImpl(_CharacterFilterOptions _value,
      $Res Function(_CharacterFilterOptions) _then)
      : super(_value, (v) => _then(v as _CharacterFilterOptions));

  @override
  _CharacterFilterOptions get _value => super._value as _CharacterFilterOptions;

  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
  }) {
    return _then(_CharacterFilterOptions(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CharacterFilterOptions implements _CharacterFilterOptions {
  _$_CharacterFilterOptions(
      {required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender});

  @override
  final String name;
  @override
  final String status;
  @override
  final String species;
  @override
  final String type;
  @override
  final String gender;

  @override
  String toString() {
    return 'CharacterFilterOptions(name: $name, status: $status, species: $species, type: $type, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterFilterOptions &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, status, species, type, gender);

  @JsonKey(ignore: true)
  @override
  _$CharacterFilterOptionsCopyWith<_CharacterFilterOptions> get copyWith =>
      __$CharacterFilterOptionsCopyWithImpl<_CharacterFilterOptions>(
          this, _$identity);
}

abstract class _CharacterFilterOptions implements CharacterFilterOptions {
  factory _CharacterFilterOptions(
      {required String name,
      required String status,
      required String species,
      required String type,
      required String gender}) = _$_CharacterFilterOptions;

  @override
  String get name;
  @override
  String get status;
  @override
  String get species;
  @override
  String get type;
  @override
  String get gender;
  @override
  @JsonKey(ignore: true)
  _$CharacterFilterOptionsCopyWith<_CharacterFilterOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
