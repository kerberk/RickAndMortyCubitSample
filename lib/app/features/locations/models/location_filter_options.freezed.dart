// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_filter_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationFilterOptionsTearOff {
  const _$LocationFilterOptionsTearOff();

  _LocationFilterOptions call(
      {required String name, required String type, required String dimension}) {
    return _LocationFilterOptions(
      name: name,
      type: type,
      dimension: dimension,
    );
  }
}

/// @nodoc
const $LocationFilterOptions = _$LocationFilterOptionsTearOff();

/// @nodoc
mixin _$LocationFilterOptions {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get dimension => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationFilterOptionsCopyWith<LocationFilterOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationFilterOptionsCopyWith<$Res> {
  factory $LocationFilterOptionsCopyWith(LocationFilterOptions value,
          $Res Function(LocationFilterOptions) then) =
      _$LocationFilterOptionsCopyWithImpl<$Res>;
  $Res call({String name, String type, String dimension});
}

/// @nodoc
class _$LocationFilterOptionsCopyWithImpl<$Res>
    implements $LocationFilterOptionsCopyWith<$Res> {
  _$LocationFilterOptionsCopyWithImpl(this._value, this._then);

  final LocationFilterOptions _value;
  // ignore: unused_field
  final $Res Function(LocationFilterOptions) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? dimension = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      dimension: dimension == freezed
          ? _value.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LocationFilterOptionsCopyWith<$Res>
    implements $LocationFilterOptionsCopyWith<$Res> {
  factory _$LocationFilterOptionsCopyWith(_LocationFilterOptions value,
          $Res Function(_LocationFilterOptions) then) =
      __$LocationFilterOptionsCopyWithImpl<$Res>;
  @override
  $Res call({String name, String type, String dimension});
}

/// @nodoc
class __$LocationFilterOptionsCopyWithImpl<$Res>
    extends _$LocationFilterOptionsCopyWithImpl<$Res>
    implements _$LocationFilterOptionsCopyWith<$Res> {
  __$LocationFilterOptionsCopyWithImpl(_LocationFilterOptions _value,
      $Res Function(_LocationFilterOptions) _then)
      : super(_value, (v) => _then(v as _LocationFilterOptions));

  @override
  _LocationFilterOptions get _value => super._value as _LocationFilterOptions;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? dimension = freezed,
  }) {
    return _then(_LocationFilterOptions(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      dimension: dimension == freezed
          ? _value.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocationFilterOptions implements _LocationFilterOptions {
  _$_LocationFilterOptions(
      {required this.name, required this.type, required this.dimension});

  @override
  final String name;
  @override
  final String type;
  @override
  final String dimension;

  @override
  String toString() {
    return 'LocationFilterOptions(name: $name, type: $type, dimension: $dimension)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationFilterOptions &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dimension, dimension) ||
                other.dimension == dimension));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type, dimension);

  @JsonKey(ignore: true)
  @override
  _$LocationFilterOptionsCopyWith<_LocationFilterOptions> get copyWith =>
      __$LocationFilterOptionsCopyWithImpl<_LocationFilterOptions>(
          this, _$identity);
}

abstract class _LocationFilterOptions implements LocationFilterOptions {
  factory _LocationFilterOptions(
      {required String name,
      required String type,
      required String dimension}) = _$_LocationFilterOptions;

  @override
  String get name;
  @override
  String get type;
  @override
  String get dimension;
  @override
  @JsonKey(ignore: true)
  _$LocationFilterOptionsCopyWith<_LocationFilterOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
