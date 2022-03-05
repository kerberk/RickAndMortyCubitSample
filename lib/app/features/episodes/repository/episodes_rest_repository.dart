import 'dart:convert';

import 'package:http/http.dart';
import 'package:rick_and_morty_sample/app/constants/strings.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episodes.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repository/episodes_repository.dart';

class EpisodesRestRepository implements EpisodesRepository {
  @override
  Future<Episode> getEpisodeById(int id) async {
    try {
      final response = await get(Uri.parse('${Strings.baseUrl}/episode/$id'));
      return Episode.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Episodes> getEpisodes(int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      final response = await get(Uri.parse('${Strings.baseUrl}/episode/?page=$page'));

      return Episodes.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Episode>> getMultipleEpisodes(List<int> ids) async {
    try {
      final response = await get(Uri.parse('${Strings.baseUrl}/episode/$ids'));

      return List<Episode>.from(
        jsonDecode(response.body).map((i) => Episode.fromJson(i)),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Episodes> getFilteredEpisodes(EpisodeFilterOptions episodeFilterOptions, int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      var filterSuffix = '?name=${episodeFilterOptions.name}&episode=${episodeFilterOptions.episode}&page=$page';

      final response = await get(Uri.parse('${Strings.baseUrl}/episode/$filterSuffix'));
      return Episodes.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
