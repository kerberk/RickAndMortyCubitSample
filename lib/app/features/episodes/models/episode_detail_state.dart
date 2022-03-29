import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';

part 'episode_detail_state.freezed.dart';

@freezed
class EpisodeDetailState with _$EpisodeDetailState {
  const factory EpisodeDetailState.initializing() = _Initializing;
  const factory EpisodeDetailState.episodeLoading() = _EpisodeLoading;
  const factory EpisodeDetailState.episodeLoaded(Episode episode) = _EpisodeLoaded;
  const factory EpisodeDetailState.error(String message) = _Error;
}
