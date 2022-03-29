import 'package:rick_and_morty_sample/app/features/episodes/models/episodes.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode_filter_options.dart';

abstract class EpisodesRepository {
  Future<Episodes> getEpisodesWithPage(int page);

  Future<Episode> getEpisodeById(int id);

  Future<List<Episode>> getEpisodesByIds(List<int> ids);

  Future<Episodes> getEpisodesWithFilterAndPage(EpisodeFilterOptions episodeFilterOptions, int page);
}
