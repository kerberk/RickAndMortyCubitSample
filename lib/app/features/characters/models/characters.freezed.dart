// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'characters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Characters _$CharactersFromJson(Map<String, dynamic> json) {
  return _Characters.fromJson(json);
}

/// @nodoc
class _$CharactersTearOff {
  const _$CharactersTearOff();

  _Characters call({required Info info, required List<Character> characters}) {
    return _Characters(
      info: info,
      characters: characters,
    );
  }

  Characters fromJson(Map<String, Object?> json) {
    return Characters.fromJson(json);
  }
}

/// @nodoc
const $Characters = _$CharactersTearOff();

/// @nodoc
mixin _$Characters {
  Info get info => throw _privateConstructorUsedError;
  List<Character> get characters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharactersCopyWith<Characters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharactersCopyWith<$Res> {
  factory $CharactersCopyWith(
          Characters value, $Res Function(Characters) then) =
      _$CharactersCopyWithImpl<$Res>;
  $Res call({Info info, List<Character> characters});

  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class _$CharactersCopyWithImpl<$Res> implements $CharactersCopyWith<$Res> {
  _$CharactersCopyWithImpl(this._value, this._then);

  final Characters _value;
  // ignore: unused_field
  final $Res Function(Characters) _then;

  @override
  $Res call({
    Object? info = freezed,
    Object? characters = freezed,
  }) {
    return _then(_value.copyWith(
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      characters: characters == freezed
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
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
abstract class _$CharactersCopyWith<$Res> implements $CharactersCopyWith<$Res> {
  factory _$CharactersCopyWith(
          _Characters value, $Res Function(_Characters) then) =
      __$CharactersCopyWithImpl<$Res>;
  @override
  $Res call({Info info, List<Character> characters});

  @override
  $InfoCopyWith<$Res> get info;
}

/// @nodoc
class __$CharactersCopyWithImpl<$Res> extends _$CharactersCopyWithImpl<$Res>
    implements _$CharactersCopyWith<$Res> {
  __$CharactersCopyWithImpl(
      _Characters _value, $Res Function(_Characters) _then)
      : super(_value, (v) => _then(v as _Characters));

  @override
  _Characters get _value => super._value as _Characters;

  @override
  $Res call({
    Object? info = freezed,
    Object? characters = freezed,
  }) {
    return _then(_Characters(
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      characters: characters == freezed
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Characters implements _Characters {
  _$_Characters({required this.info, required this.characters});

  factory _$_Characters.fromJson(Map<String, dynamic> json) =>
      _$$_CharactersFromJson(json);

  @override
  final Info info;
  @override
  final List<Character> characters;

  @override
  String toString() {
    return 'Characters(info: $info, characters: $characters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Characters &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality()
                .equals(other.characters, characters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(characters));

  @JsonKey(ignore: true)
  @override
  _$CharactersCopyWith<_Characters> get copyWith =>
      __$CharactersCopyWithImpl<_Characters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharactersToJson(this);
  }
}

abstract class _Characters implements Characters {
  factory _Characters(
      {required Info info,
      required List<Character> characters}) = _$_Characters;

  factory _Characters.fromJson(Map<String, dynamic> json) =
      _$_Characters.fromJson;

  @override
  Info get info;
  @override
  List<Character> get characters;
  @override
  @JsonKey(ignore: true)
  _$CharactersCopyWith<_Characters> get copyWith =>
      throw _privateConstructorUsedError;
}
