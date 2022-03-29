import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';

part 'character_detail_state.freezed.dart';

@freezed
class CharacterDetailState with _$CharacterDetailState {
  const factory CharacterDetailState.initializing() = _Initializing;
  const factory CharacterDetailState.characterLoading() = _CharacterLoading;
  const factory CharacterDetailState.characterLoaded(Character characters) = _CharacterLoaded;
  const factory CharacterDetailState.error(String message) = _Error;
}
