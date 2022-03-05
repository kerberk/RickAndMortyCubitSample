import 'package:rick_and_morty_sample/app/features/episodes/models/episodes.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode_filter_options.dart';

abstract class EpisodesRepository {
  Future<Episodes> getEpisodes(int page);

  Future<Episode> getEpisodeById(int id);

  Future<List<Episode>> getMultipleEpisodes(List<int> ids);

  Future<Episodes> getFilteredEpisodes(EpisodeFilterOptions episodeFilterOptions, int page);
}
