import 'package:rick_and_morty_sample/app/constants/api_path.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episodes.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repositories/episodes_repository.dart';
import 'package:rick_and_morty_sample/app/services/network/http_service.dart';

class EpisodesRestRepository implements EpisodesRepository {
  final HttpService _httpService = HttpService();

  @override
  Future<Episodes> getEpisodesWithPage(int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      final response = await _httpService.getRequest(Uri.parse(ApiPath.getEpisodesWithPage(page)));

      return Episodes.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Episode> getEpisodeById(int id) async {
    try {
      final response = await _httpService.getRequest(Uri.parse(ApiPath.getEpisodeById(id)));

      return Episode.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Episode>> getEpisodesByIds(List<int> ids) async {
    try {
      final response = await _httpService.getRequest(Uri.parse(ApiPath.getEpisodesByIds(ids)));

      return List<Episode>.from(
        response.data.map((i) => Episode.fromJson(i)),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Episodes> getEpisodesWithFilterAndPage(EpisodeFilterOptions episodeFilterOptions, int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      var filterSuffix = '?name=${episodeFilterOptions.name}&episode=${episodeFilterOptions.episode}';

      final response =
          await _httpService.getRequest(Uri.parse(ApiPath.getEpisodesWithFilterAndPage(filterSuffix, page)));

      return Episodes.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
