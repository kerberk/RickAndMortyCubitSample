import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';

part 'characters_state.freezed.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState.initializing() = _Initializing;
  const factory CharactersState.charactersLoading(List<Character> oldCharacters, {@Default(false) bool isFirstLoad}) =
      _CharactersLoading;
  const factory CharactersState.charactersLoaded(List<Character> characters) = _CharactersLoaded;
  const factory CharactersState.error(String message) = _Error;
}
