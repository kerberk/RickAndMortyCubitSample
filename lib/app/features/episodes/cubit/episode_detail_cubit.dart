import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repository/episodes_repository.dart';

part 'episode_detail_state.dart';

class EpisodeDetailCubit extends Cubit<EpisodeDetailState> {
  final EpisodesRepository _episodesRepository;

  final int _id;

  EpisodeDetailCubit(this._episodesRepository, this._id) : super(const EpisodeDetailInitial());

  Future<void> getEpisodeById({int id = 0}) async {
    try {
      if (state is EpisodeDetailLoading) return;

      emit(const EpisodeDetailLoading());

      var result = await _episodesRepository.getEpisodeById(id == 0 ? _id : id);

      emit(EpisodeDetailLoaded(result));
    } catch (e) {
      emit(const EpisodeDetailError('Couldn\'t load data'));
    }
  }
}
