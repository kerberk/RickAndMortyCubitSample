import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_repository.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';

part 'characters_state.dart';

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

  CharactersCubit(this._charactersRepository) : super(const CharactersInitial());

  get isFilterActive => _isFilterActive;

  Future<void> getCharacters() async {
    try {
      if (state is CharactersLoading) return;
      if (_allCharactersInfo.pages != 0 && _allCharactersInfo.pages <= _charactersPage) return;

      _filteredCharactersPage = 1;
      _isFilterActive = false;

      final currentState = state;

      var oldCharacters = <Character>[];
      if (currentState is CharactersLoaded) {
        oldCharacters = currentState.characters;
      }

      emit(CharactersLoading(oldCharacters, isFirstLoad: _charactersPage == 1));

      var result = await _charactersRepository.getCharactersWithPage(_charactersPage);

      _allCharactersInfo = result.info;
      _characters.addAll(result.characters);

      emit(CharactersLoaded(_characters));

      _charactersPage++;
    } catch (e) {
      emit(const CharactersError('Couldn\'t load data'));
    }
  }

  Future<void> getMultipleCharacters(List<int> ids) async {
    try {
      if (state is CharactersLoading) return;

      emit(const CharactersLoading([]));

      var result = await _charactersRepository.getCharactersByIds(ids);

      _characters = result;

      emit(CharactersLoaded(_characters));
    } catch (e) {
      emit(const CharactersError('Couldn\'t load data'));
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
      if (state is CharactersLoading) return;

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
      if (currentState is CharactersLoaded) {
        oldCharacters = currentState.characters;
      }

      emit(CharactersLoading(oldCharacters, isFirstLoad: _filteredCharactersPage == 1));

      var result =
          await _charactersRepository.getCharactersWithFilterAndPage(_lastFilterOptions, _filteredCharactersPage);

      _allCharactersInfo = result.info;
      _characters.addAll(result.characters);

      emit(CharactersLoaded(_characters));

      _filteredCharactersPage++;
    } catch (e) {
      emit(const CharactersError('Couldn\'t load data'));
    }
  }
}
