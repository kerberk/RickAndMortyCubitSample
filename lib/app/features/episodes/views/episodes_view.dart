import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/features/episodes/cubits/episodes_cubit.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episodes_state.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repositories/episodes_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/settings/views/settings_view.dart';
import 'package:rick_and_morty_sample/app/routes/router.gr.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/circular_loading_indicator.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class EpisodesView extends StatefulWidget implements AutoRouteWrapper {
  const EpisodesView({Key? key}) : super(key: key);

  @override
  State<EpisodesView> createState() => _EpisodesViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<EpisodesCubit>(
      create: (context) => EpisodesCubit(EpisodesRestRepository()),
      child: this,
    );
  }
}

class _EpisodesViewState extends State<EpisodesView> {
  final scrollController = ScrollController();
  final TextEditingController _searchEpisodeTextController = TextEditingController();
  final TextEditingController _searchNameTextController = TextEditingController();

  late EpisodesCubit _episodesCubit;

  @override
  void initState() {
    super.initState();
    _episodesCubit = BlocProvider.of<EpisodesCubit>(context);

    _episodesCubit.getEpisodes();

    _setupScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.episodes_appbar_title.tr()),
        leading: GestureDetector(
          onTap: () {
            _handleRouteWithCallback();
          },
          child: const Icon(
            Icons.settings,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: _toggleFilter,
              child: const Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Visibility(
            visible: _episodesCubit.showFilterOptions,
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildSearchInput(context, _searchEpisodeTextController, LocaleKeys.episodes_hints_search_episode.tr()),
                const SizedBox(height: 12),
                _buildSearchInput(context, _searchNameTextController, LocaleKeys.episodes_hints_search_name.tr()),
                const SizedBox(height: 12),
                _buildFilterButton(),
                const SizedBox(height: 12),
                Divider(color: Colors.grey[400]),
              ],
            ),
          ),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildSearchInput(BuildContext context, TextEditingController textEditingController, String? hintText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 20.0,
            ),
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        _episodesCubit.filterEpisodes(_searchEpisodeTextController.text, _searchNameTextController.text);
      },
      child: Text(LocaleKeys.episodes_buttons_search.tr()),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: BlocConsumer<EpisodesCubit, EpisodesState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            ),
            orElse: () => null,
          );
        },
        builder: (context, state) {
          bool isLoading = false;

          return state.when(
            initializing: () => const CircularLoadingIndicator(),
            episodesLoading: (oldEpisodes, isFirstLoad) {
              if (isFirstLoad) {
                return const CircularLoadingIndicator();
              } else {
                isLoading = true;
                return _buildEpisodesList(oldEpisodes, isLoading);
              }
            },
            episodesLoaded: (episodes) => _buildEpisodesList(episodes, isLoading),
            error: (_) => Container(),
          );
        },
      ),
    );
  }

  Widget _buildEpisodesList(List<Episode> episodes, bool isLoading) {
    List<Widget> listTiles = [];

    for (var episode in episodes) {
      listTiles.add(
        ListTile(
          title: Text(episode.name),
        ),
      );
    }

    return Scrollbar(
      child: ListView.separated(
        controller: scrollController,
        itemCount: episodes.length + (isLoading ? 1 : 0),
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemBuilder: (context, index) {
          if (index < episodes.length) {
            return _episodeItem(context, episodes[index]);
          } else {
            Timer(
              const Duration(milliseconds: 30),
              () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
            );
            return const CircularLoadingIndicator();
          }
        },
      ),
    );
  }

  Widget _episodeItem(BuildContext context, Episode episode) {
    return InkWell(
      onTap: () => context.router.push(EpisodeDetailRoute(episodeId: episode.id)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          children: [
            Text(episode.episode),
            const SizedBox(
              width: 20.0,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                episode.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
        if (_episodesCubit.isFilterActive()) {
          _episodesCubit.filterEpisodes(_searchEpisodeTextController.text, _searchNameTextController.text);
        } else {
          _episodesCubit.getEpisodes();
        }
      }
    });
  }

  void _toggleFilter() {
    _episodesCubit.showFilterOptions = !_episodesCubit.showFilterOptions;
    setState(() {});
  }

  void _handleRouteWithCallback() async {
    Map<String, dynamic>? callback = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsView(),
      ),
    );

    if (callback != null) {
      if (callback.containsKey('reload') && callback['reload']) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _searchEpisodeTextController.dispose();
    _searchNameTextController.dispose();

    super.dispose();
  }
}
