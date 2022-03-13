import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repository/episodes_repository.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

part 'episode_detail_state.dart';

class EpisodeDetailCubit extends Cubit<EpisodeDetailState> {
  final EpisodesRepository _episodesRepository;

  EpisodeDetailCubit(this._episodesRepository) : super(const EpisodeDetailInitial());

  Future<void> getEpisodeById({int id = 0}) async {
    try {
      if (state is EpisodeDetailLoading) return;

      emit(const EpisodeDetailLoading());

      var result = await _episodesRepository.getEpisodeById(id);

      emit(EpisodeDetailLoaded(result));
    } catch (e) {
      emit(EpisodeDetailError(LocaleKeys.error_loading_data.tr()));
    }
  }
}
