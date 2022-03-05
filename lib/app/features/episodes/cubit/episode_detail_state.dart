part of 'episode_detail_cubit.dart';

@immutable
abstract class EpisodeDetailState {
  const EpisodeDetailState();
}

class EpisodeDetailInitial extends EpisodeDetailState {
  const EpisodeDetailInitial();
}

class EpisodeDetailLoading extends EpisodeDetailState {
  const EpisodeDetailLoading();
}

class EpisodeDetailLoaded extends EpisodeDetailState {
  final Episode episode;

  const EpisodeDetailLoaded(this.episode);
}

class EpisodeDetailError extends EpisodeDetailState {
  final String message;

  const EpisodeDetailError(this.message);
}
