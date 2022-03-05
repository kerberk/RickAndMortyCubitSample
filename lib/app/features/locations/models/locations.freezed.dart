// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'locations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return _Locations.fromJson(json);
}

/// @nodoc
class _$LocationsTearOff {
  const _$LocationsTearOff();

  _Locations call({required Info info, required List<Location> locations}) {
    return _Locations(
      info: info,
      locations: locations,
    );
  }

  Locations fromJson(Map<String, Object?> json) {
    return Locations.fromJson(json);
  }
}

/// @nodoc
const $Locations = _$LocationsTearOff();

/// @nodoc
mixin _$Locations {
  Info get info => throw _privateConstructorUsedError;
  List<Location> get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationsCopyWith<Locations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationsCopyWith<$Res> {
  factory $LocationsCopyWith(Locations value, $Res Function(Locations) then) =
      _$LocationsCopyWithImpl<$Res>;
  $Res call({Info info, List<Location> locations});

  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class _$LocationsCopyWithImpl<$Res> implements $LocationsCopyWith<$Res> {
  _$LocationsCopyWithImpl(this._value, this._then);

  final Locations _value;
  // ignore: unused_field
  final $Res Function(Locations) _then;

  @override
  $Res call({
    Object? info = freezed,
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ));
  }

  @override
  $InfoCopyWith<$Res> get info {
    return $InfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc
abstract class _$LocationsCopyWith<$Res> implements $LocationsCopyWith<$Res> {
  factory _$LocationsCopyWith(
          _Locations value, $Res Function(_Locations) then) =
      __$LocationsCopyWithImpl<$Res>;
  @override
  $Res call({Info info, List<Location> locations});

  @override
  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class __$LocationsCopyWithImpl<$Res> extends _$LocationsCopyWithImpl<$Res>
    implements _$LocationsCopyWith<$Res> {
  __$LocationsCopyWithImpl(_Locations _value, $Res Function(_Locations) _then)
      : super(_value, (v) => _then(v as _Locations));

  @override
  _Locations get _value => super._value as _Locations;

  @override
  $Res call({
    Object? info = freezed,
    Object? locations = freezed,
  }) {
    return _then(_Locations(
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Locations implements _Locations {
  _$_Locations({required this.info, required this.locations});

  factory _$_Locations.fromJson(Map<String, dynamic> json) =>
      _$$_LocationsFromJson(json);

  @override
  final Info info;
  @override
  final List<Location> locations;

  @override
  String toString() {
    return 'Locations(info: $info, locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Locations &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other.locations, locations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(locations));

  @JsonKey(ignore: true)
  @override
  _$LocationsCopyWith<_Locations> get copyWith =>
      __$LocationsCopyWithImpl<_Locations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationsToJson(this);
  }
}

abstract class _Locations implements Locations {
  factory _Locations({required Info info, required List<Location> locations}) =
      _$_Locations;

  factory _Locations.fromJson(Map<String, dynamic> json) =
      _$_Locations.fromJson;

  @override
  Info get info;
  @override
  List<Location> get locations;
  @override
  @JsonKey(ignore: true)
  _$LocationsCopyWith<_Locations> get copyWith =>
      throw _privateConstructorUsedError;
}
