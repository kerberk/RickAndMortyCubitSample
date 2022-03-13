import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repository/episodes_repository.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final EpisodesRepository _episodesRepository;

  int _episodesPage = 1;
  int _filteredEpisodesPage = 1;

  bool _isFilterActive = false;

  EpisodeFilterOptions _lastFilterOptions = EpisodeFilterOptions(episode: '', name: '');

  Info _allEpisodesInfo = Info(count: 0, pages: 0);
  List<Episode> _episodes = [];

  bool showFilterOptions = false;

  EpisodesCubit(this._episodesRepository) : super(const EpisodesInitial());

  bool isFilterActive() => _isFilterActive;

  Future<void> getEpisodes() async {
    try {
      if (state is EpisodesLoading) return;
      if (_allEpisodesInfo.pages != 0 && _allEpisodesInfo.pages <= _episodesPage) return;

      _filteredEpisodesPage = 1;
      _isFilterActive = false;

      final currentState = state;

      var oldEpisodes = <Episode>[];
      if (currentState is EpisodesLoaded) {
        oldEpisodes = currentState.episodes;
      }

      emit(EpisodesLoading(oldEpisodes, isFirstLoad: _episodesPage == 1));

      var result = await _episodesRepository.getEpisodesWithPage(_episodesPage);

      _allEpisodesInfo = result.info;
      _episodes.addAll(result.episodes);

      emit(EpisodesLoaded(_episodes));

      _episodesPage++;
    } catch (e) {
      emit(EpisodesError(LocaleKeys.error_loading_data.tr()));
    }
  }

  Future<void> getMultipleEpisodes(List<int> ids) async {
    try {
      if (state is EpisodesLoading) return;

      emit(const EpisodesLoading([]));

      var result = await _episodesRepository.getEpisodesByIds(ids);

      _episodes = result;

      emit(EpisodesLoaded(_episodes));
    } catch (e) {
      emit(EpisodesError(LocaleKeys.error_loading_data.tr()));
    }
  }

  Future<void> filterEpisodes(String episode, String name) async {
    try {
      // If state is already loading -> return
      if (state is EpisodesLoading) return;

      // If filter are empty -> get episodes without filter
      if (episode == '' && name == '') {
        _episodes = [];
        _allEpisodesInfo = Info(count: 0, pages: 0);
        getEpisodes();
        return;
      }

      // If filtered input is new -> reset filter data
      if (_lastFilterOptions.episode != episode || _lastFilterOptions.name != name) {
        _filteredEpisodesPage = 1;
        _episodes = [];
        _allEpisodesInfo = Info(count: 0, pages: 0);
      }

      // If last page is already reached -> return
      if (_allEpisodesInfo.pages != 0 && _allEpisodesInfo.pages <= _filteredEpisodesPage) return;

      // Reset episodes pages
      _episodesPage = 1;

      // Set filter options
      _isFilterActive = true;
      _lastFilterOptions = EpisodeFilterOptions(episode: episode, name: name);

      final currentState = state;

      var oldEpisodes = <Episode>[];
      if (currentState is EpisodesLoaded) {
        oldEpisodes = currentState.episodes;
      }

      emit(EpisodesLoading(oldEpisodes, isFirstLoad: _filteredEpisodesPage == 1));

      var episodeFilterOptions = EpisodeFilterOptions(episode: episode, name: name);
      var result = await _episodesRepository.getEpisodesWithFilterAndPage(episodeFilterOptions, _filteredEpisodesPage);

      _allEpisodesInfo = result.info;
      _episodes.addAll(result.episodes);

      emit(EpisodesLoaded(_episodes));

      _filteredEpisodesPage++;
    } catch (e) {
      emit(EpisodesError(LocaleKeys.error_loading_data.tr()));
    }
  }
}
