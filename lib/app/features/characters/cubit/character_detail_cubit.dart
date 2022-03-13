import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_repository.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

part 'character_detail_state.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  final CharactersRepository _charactersRepository;

  CharacterDetailCubit(this._charactersRepository) : super(const CharacterDetailInitial());

  Future<void> getCharacterById(int id) async {
    try {
      if (state is CharacterDetailLoading) return;

      emit(const CharacterDetailLoading());

      var result = await _charactersRepository.getCharacterById(id);

      emit(CharacterDetailLoaded(result));
    } catch (e) {
      emit(CharacterDetailError(LocaleKeys.error_loading_data.tr()));
    }
  }

  Future<void> getEpisodeById(int id) async {
    try {
      if (state is CharacterDetailLoading) return;

      emit(const CharacterDetailLoading());

      var result = await _charactersRepository.getCharacterById(id);

      emit(CharacterDetailLoaded(result));
    } catch (e) {
      emit(CharacterDetailError(LocaleKeys.error_loading_data.tr()));
    }
  }
}
