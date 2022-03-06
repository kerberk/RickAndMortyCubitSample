import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/characters.dart';

abstract class CharactersRepository {
  Future<Characters> getCharactersWithPage(int page);

  Future<Character> getCharacterById(int id);

  Future<List<Character>> getCharactersByIds(List<int> ids);

  Future<Characters> getCharactersWithFilterAndPage(CharacterFilterOptions characterFilterOptions, int page);
}
