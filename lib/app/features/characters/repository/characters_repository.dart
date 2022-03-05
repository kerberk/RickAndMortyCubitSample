import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/characters.dart';

abstract class CharactersRepository {
  Future<Characters> getCharacters(int page);

  Future<Character> getCharacterById(int id);

  Future<List<Character>> getMultipleCharacters(List<int> ids);

  Future<Characters> getFilteredCharacters(CharacterFilterOptions characterFilterOptions, int page);
}
