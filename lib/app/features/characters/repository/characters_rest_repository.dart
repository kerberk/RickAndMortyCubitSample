import 'dart:convert';

import 'package:http/http.dart';
import 'package:rick_and_morty_sample/app/constants/strings.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/characters.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_repository.dart';

class CharactersRestRepository implements CharactersRepository {
  @override
  Future<Character> getCharacterById(int id) async {
    try {
      final response = await get(Uri.parse('${Strings.baseUrl}/character/$id'));
      return Character.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Characters> getCharacters(int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      final response = await get(Uri.parse('${Strings.baseUrl}/character/?page=$page'));

      return Characters.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Character>> getMultipleCharacters(List<int> ids) async {
    try {
      final response = await get(Uri.parse('${Strings.baseUrl}/character/$ids'));

      return List<Character>.from(
        jsonDecode(response.body).map((i) => Character.fromJson(i)),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Characters> getFilteredCharacters(CharacterFilterOptions characterFilterOptions, int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      var filterSuffix =
          '?name=${characterFilterOptions.name}&gender=${characterFilterOptions.gender}&species=${characterFilterOptions.species}&status=${characterFilterOptions.status}&type=${characterFilterOptions.type}&page=$page';

      final response = await get(Uri.parse('${Strings.baseUrl}/character/$filterSuffix'));
      return Characters.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
