import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';

part 'episodes_state.freezed.dart';

@freezed
class EpisodesState with _$EpisodesState {
  const factory EpisodesState.initializing() = _Initializing;
  const factory EpisodesState.episodesLoading(List<Episode> oldEpisodes, {@Default(false) bool isFirstLoad}) =
      _EpisodesLoading;
  const factory EpisodesState.episodesLoaded(List<Episode> episodes) = _EpisodesLoaded;
  const factory EpisodesState.error(String message) = _Error;
}
