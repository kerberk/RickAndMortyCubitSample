import 'package:rick_and_morty_sample/app/constants/api_path.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/characters.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_repository.dart';
import 'package:rick_and_morty_sample/app/services/network/http_service.dart';

class CharactersRestRepository implements CharactersRepository {
  final HttpService _httpService = HttpService();

  @override
  Future<Characters> getCharactersWithPage(int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      final response = await _httpService.getRequest(Uri.parse(ApiPath.getCharactersWithPage(page)));

      return Characters.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Character> getCharacterById(int id) async {
    try {
      final response = await _httpService.getRequest(Uri.parse(ApiPath.getCharacterById(id)));

      return Character.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Character>> getCharactersByIds(List<int> ids) async {
    try {
      final response = await _httpService.getRequest(Uri.parse(ApiPath.getCharactersByIds(ids)));

      return List<Character>.from(
        response.data.map((i) => Character.fromJson(i)),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Characters> getCharactersWithFilterAndPage(CharacterFilterOptions characterFilterOptions, int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      var filterSuffix =
          '?name=${characterFilterOptions.name}&gender=${characterFilterOptions.gender}&species=${characterFilterOptions.species}&status=${characterFilterOptions.status}&type=${characterFilterOptions.type}';

      final response =
          await _httpService.getRequest(Uri.parse(ApiPath.getCharactersWithFilterAndPage(filterSuffix, page)));

      return Characters.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
