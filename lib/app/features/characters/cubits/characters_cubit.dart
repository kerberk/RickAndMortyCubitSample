import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/characters_state.dart';
import 'package:rick_and_morty_sample/app/features/characters/repositories/characters_repository.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository _charactersRepository;

  int _charactersPage = 1;
  int _filteredCharactersPage = 1;

  bool _isFilterActive = false;

  CharacterFilterOptions _lastFilterOptions = CharacterFilterOptions(
    name: '',
    status: '',
    species: '',
    type: '',
    gender: '',
  );

  Info _allCharactersInfo = Info(count: 0, pages: 0);
  List<Character> _characters = [];

  bool showFilterOptions = false;

  CharactersCubit(this._charactersRepository) : super(const CharactersState.initializing());

  get isFilterActive => _isFilterActive;

  Future<void> getCharacters() async {
    try {
      if (state.maybeWhen(charactersLoading: (_, __) => true, orElse: () => false)) return;
      if (_allCharactersInfo.pages != 0 && _allCharactersInfo.pages <= _charactersPage) return;

      _filteredCharactersPage = 1;
      _isFilterActive = false;

      final currentState = state;

      var oldCharacters = <Character>[];
      if (currentState.maybeWhen(charactersLoaded: (_) => true, orElse: () => false)) {
        oldCharacters = currentState.maybeWhen(charactersLoaded: (data) => data, orElse: () => []);
      }

      emit(CharactersState.charactersLoading(oldCharacters, isFirstLoad: _charactersPage == 1));

      var result = await _charactersRepository.getCharactersWithPage(_charactersPage);

      _allCharactersInfo = result.info;
      _characters.addAll(result.characters);

      emit(CharactersState.charactersLoaded(_characters));

      _charactersPage++;
    } catch (e) {
      emit(CharactersState.error(LocaleKeys.error_loading_data.tr()));
    }
  }

  Future<void> getMultipleCharacters(List<int> ids) async {
    try {
      if (state.maybeWhen(charactersLoading: (_, __) => true, orElse: () => false)) return;

      emit(const CharactersState.charactersLoading([]));

      var result = await _charactersRepository.getCharactersByIds(ids);

      _characters = result;

      emit(CharactersState.charactersLoaded(_characters));
    } catch (e) {
      emit(CharactersState.error(LocaleKeys.error_loading_data.tr()));
    }
  }

  Future<void> filterCharacters(
    String name,
    String status,
    String species,
    String type,
    String gender,
  ) async {
    try {
      // If state is already loading -> return
      if (state.maybeWhen(charactersLoading: (_, __) => true, orElse: () => false)) return;

      // If filter are empty -> get episodes without filter
      if (name == '' && status == '' && species == '' && type == '' && gender == '') {
        _characters = [];
        _allCharactersInfo = Info(count: 0, pages: 0);
        getCharacters();
        return;
      }

      // If filtered input is new -> reset filter data
      if (_lastFilterOptions.name != name ||
          _lastFilterOptions.status != status ||
          _lastFilterOptions.species != species ||
          _lastFilterOptions.type != type ||
          _lastFilterOptions.gender != gender) {
        _filteredCharactersPage = 1;
        _characters = [];
        _allCharactersInfo = Info(count: 0, pages: 0);
      }

      // If last page is already reached -> return
      if (_allCharactersInfo.pages != 0 && _allCharactersInfo.pages <= _filteredCharactersPage) return;

      // Reset episodes pages
      _charactersPage = 1;

      // Set filter options
      _isFilterActive = true;
      _lastFilterOptions = CharacterFilterOptions(
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
      );

      final currentState = state;

      var oldCharacters = <Character>[];
      if (currentState.maybeWhen(charactersLoaded: (_) => true, orElse: () => false)) {
        oldCharacters = currentState.maybeWhen(charactersLoaded: (characters) => characters, orElse: () => []);
      }

      emit(CharactersState.charactersLoading(oldCharacters, isFirstLoad: _filteredCharactersPage == 1));

      var result =
          await _charactersRepository.getCharactersWithFilterAndPage(_lastFilterOptions, _filteredCharactersPage);

      _allCharactersInfo = result.info;
      _characters.addAll(result.characters);

      emit(CharactersState.charactersLoaded(_characters));

      _filteredCharactersPage++;
    } catch (e) {
      emit(CharactersState.error(LocaleKeys.error_loading_data.tr()));
    }
  }
}
