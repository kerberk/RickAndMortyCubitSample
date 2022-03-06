// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'episode_filter_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EpisodeFilterOptionsTearOff {
  const _$EpisodeFilterOptionsTearOff();

  _EpisodeFilterOptions call({required String episode, required String name}) {
    return _EpisodeFilterOptions(
      episode: episode,
      name: name,
    );
  }
}

/// @nodoc
const $EpisodeFilterOptions = _$EpisodeFilterOptionsTearOff();

/// @nodoc
mixin _$EpisodeFilterOptions {
  String get episode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EpisodeFilterOptionsCopyWith<EpisodeFilterOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeFilterOptionsCopyWith<$Res> {
  factory $EpisodeFilterOptionsCopyWith(EpisodeFilterOptions value,
          $Res Function(EpisodeFilterOptions) then) =
      _$EpisodeFilterOptionsCopyWithImpl<$Res>;
  $Res call({String episode, String name});
}

/// @nodoc
class _$EpisodeFilterOptionsCopyWithImpl<$Res>
    implements $EpisodeFilterOptionsCopyWith<$Res> {
  _$EpisodeFilterOptionsCopyWithImpl(this._value, this._then);

  final EpisodeFilterOptions _value;
  // ignore: unused_field
  final $Res Function(EpisodeFilterOptions) _then;

  @override
  $Res call({
    Object? episode = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$EpisodeFilterOptionsCopyWith<$Res>
    implements $EpisodeFilterOptionsCopyWith<$Res> {
  factory _$EpisodeFilterOptionsCopyWith(_EpisodeFilterOptions value,
          $Res Function(_EpisodeFilterOptions) then) =
      __$EpisodeFilterOptionsCopyWithImpl<$Res>;
  @override
  $Res call({String episode, String name});
}

/// @nodoc
class __$EpisodeFilterOptionsCopyWithImpl<$Res>
    extends _$EpisodeFilterOptionsCopyWithImpl<$Res>
    implements _$EpisodeFilterOptionsCopyWith<$Res> {
  __$EpisodeFilterOptionsCopyWithImpl(
      _EpisodeFilterOptions _value, $Res Function(_EpisodeFilterOptions) _then)
      : super(_value, (v) => _then(v as _EpisodeFilterOptions));

  @override
  _EpisodeFilterOptions get _value => super._value as _EpisodeFilterOptions;

  @override
  $Res call({
    Object? episode = freezed,
    Object? name = freezed,
  }) {
    return _then(_EpisodeFilterOptions(
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EpisodeFilterOptions implements _EpisodeFilterOptions {
  _$_EpisodeFilterOptions({required this.episode, required this.name});

  @override
  final String episode;
  @override
  final String name;

  @override
  String toString() {
    return 'EpisodeFilterOptions(episode: $episode, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EpisodeFilterOptions &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, episode, name);

  @JsonKey(ignore: true)
  @override
  _$EpisodeFilterOptionsCopyWith<_EpisodeFilterOptions> get copyWith =>
      __$EpisodeFilterOptionsCopyWithImpl<_EpisodeFilterOptions>(
          this, _$identity);
}

abstract class _EpisodeFilterOptions implements EpisodeFilterOptions {
  factory _EpisodeFilterOptions(
      {required String episode,
      required String name}) = _$_EpisodeFilterOptions;

  @override
  String get episode;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$EpisodeFilterOptionsCopyWith<_EpisodeFilterOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
