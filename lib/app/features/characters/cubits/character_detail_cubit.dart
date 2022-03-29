import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character_detail_state.dart';
import 'package:rick_and_morty_sample/app/features/characters/repositories/characters_repository.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  final CharactersRepository _charactersRepository;

  CharacterDetailCubit(this._charactersRepository) : super(const CharacterDetailState.initializing());

  Future<void> getCharacterById(int id) async {
    try {
      if (state.maybeWhen(characterLoading: () => true, orElse: () => false)) return;

      emit(const CharacterDetailState.characterLoading());

      var result = await _charactersRepository.getCharacterById(id);

      emit(CharacterDetailState.characterLoaded(result));
    } catch (e) {
      emit(CharacterDetailState.error(LocaleKeys.error_loading_data.tr()));
    }
  }

  Future<void> getEpisodeById(int id) async {
    try {
      if (state.maybeWhen(characterLoading: () => true, orElse: () => false)) return;

      emit(const CharacterDetailState.characterLoading());

      var result = await _charactersRepository.getCharacterById(id);

      emit(CharacterDetailState.characterLoaded(result));
    } catch (e) {
      emit(CharacterDetailState.error(LocaleKeys.error_loading_data.tr()));
    }
  }
}
