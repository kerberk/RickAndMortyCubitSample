part of 'episodes_cubit.dart';

@immutable
abstract class EpisodesState {
  const EpisodesState();
}

class EpisodesInitial extends EpisodesState {
  const EpisodesInitial();
}

class EpisodesLoading extends EpisodesState {
  final List<Episode> oldEpisodes;
  final bool isFirstLoad;

  const EpisodesLoading(this.oldEpisodes, {this.isFirstLoad = false});
}

class EpisodesLoaded extends EpisodesState {
  final List<Episode> episodes;

  const EpisodesLoaded(this.episodes);
}

class EpisodesError extends EpisodesState {
  final String message;

  const EpisodesError(this.message);
}
