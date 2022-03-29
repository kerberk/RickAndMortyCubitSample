import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode_detail_state.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repositories/episodes_repository.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class EpisodeDetailCubit extends Cubit<EpisodeDetailState> {
  final EpisodesRepository _episodesRepository;

  EpisodeDetailCubit(this._episodesRepository) : super(const EpisodeDetailState.initializing());

  Future<void> getEpisodeById({int id = 0}) async {
    try {
      if (state.maybeWhen(episodeLoading: () => true, orElse: () => false)) return;

      emit(const EpisodeDetailState.episodeLoading());

      var result = await _episodesRepository.getEpisodeById(id);

      emit(EpisodeDetailState.episodeLoaded(result));
    } catch (e) {
      emit(EpisodeDetailState.error(LocaleKeys.error_loading_data.tr()));
    }
  }
}
