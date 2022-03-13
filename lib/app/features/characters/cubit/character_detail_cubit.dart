import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_repository.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

part 'character_detail_state.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  final CharactersRepository _charactersRepository;

  final int _id;

  CharacterDetailCubit(this._charactersRepository, this._id) : super(const CharacterDetailInitial());

  Future<void> getCharacterById() async {
    try {
      if (state is CharacterDetailLoading) return;

      emit(const CharacterDetailLoading());

      var result = await _charactersRepository.getCharacterById(_id);

      emit(CharacterDetailLoaded(result));
    } catch (e) {
      emit(CharacterDetailError(LocaleKeys.error_loading_data.tr()));
    }
  }

  Future<void> getEpisodeById() async {
    try {
      if (state is CharacterDetailLoading) return;

      emit(const CharacterDetailLoading());

      var result = await _charactersRepository.getCharacterById(_id);

      emit(CharacterDetailLoaded(result));
    } catch (e) {
      emit(CharacterDetailError(LocaleKeys.error_loading_data.tr()));
    }
  }
}
