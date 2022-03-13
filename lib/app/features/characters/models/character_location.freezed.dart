// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'character_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterLocation _$CharacterLocationFromJson(Map<String, dynamic> json) {
  return _CharacterLocation.fromJson(json);
}

/// @nodoc
class _$CharacterLocationTearOff {
  const _$CharacterLocationTearOff();

  _CharacterLocation call({required String name, required String url}) {
    return _CharacterLocation(
      name: name,
      url: url,
    );
  }

  CharacterLocation fromJson(Map<String, Object?> json) {
    return CharacterLocation.fromJson(json);
  }
}

/// @nodoc
const $CharacterLocation = _$CharacterLocationTearOff();

/// @nodoc
mixin _$CharacterLocation {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterLocationCopyWith<CharacterLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterLocationCopyWith<$Res> {
  factory $CharacterLocationCopyWith(
          CharacterLocation value, $Res Function(CharacterLocation) then) =
      _$CharacterLocationCopyWithImpl<$Res>;
  $Res call({String name, String url});
}

/// @nodoc
class _$CharacterLocationCopyWithImpl<$Res>
    implements $CharacterLocationCopyWith<$Res> {
  _$CharacterLocationCopyWithImpl(this._value, this._then);

  final CharacterLocation _value;
  // ignore: unused_field
  final $Res Function(CharacterLocation) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CharacterLocationCopyWith<$Res>
    implements $CharacterLocationCopyWith<$Res> {
  factory _$CharacterLocationCopyWith(
          _CharacterLocation value, $Res Function(_CharacterLocation) then) =
      __$CharacterLocationCopyWithImpl<$Res>;
  @override
  $Res call({String name, String url});
}

/// @nodoc
class __$CharacterLocationCopyWithImpl<$Res>
    extends _$CharacterLocationCopyWithImpl<$Res>
    implements _$CharacterLocationCopyWith<$Res> {
  __$CharacterLocationCopyWithImpl(
      _CharacterLocation _value, $Res Function(_CharacterLocation) _then)
      : super(_value, (v) => _then(v as _CharacterLocation));

  @override
  _CharacterLocation get _value => super._value as _CharacterLocation;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_CharacterLocation(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterLocation implements _CharacterLocation {
  _$_CharacterLocation({required this.name, required this.url});

  factory _$_CharacterLocation.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterLocationFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'CharacterLocation(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharacterLocation &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  _$CharacterLocationCopyWith<_CharacterLocation> get copyWith =>
      __$CharacterLocationCopyWithImpl<_CharacterLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterLocationToJson(this);
  }
}

abstract class _CharacterLocation implements CharacterLocation {
  factory _CharacterLocation({required String name, required String url}) =
      _$_CharacterLocation;

  factory _CharacterLocation.fromJson(Map<String, dynamic> json) =
      _$_CharacterLocation.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$CharacterLocationCopyWith<_CharacterLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
