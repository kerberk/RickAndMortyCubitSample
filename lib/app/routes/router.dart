import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty_sample/app/features/characters/views/character_detail_view.dart';
import 'package:rick_and_morty_sample/app/features/characters/views/characters_view.dart';
import 'package:rick_and_morty_sample/app/features/episodes/views/episode_detail_view.dart';
import 'package:rick_and_morty_sample/app/features/episodes/views/episodes_view.dart';
import 'package:rick_and_morty_sample/app/features/home/views/home_view.dart';
import 'package:rick_and_morty_sample/app/features/locations/views/location_detail_view.dart';
import 'package:rick_and_morty_sample/app/features/locations/views/locations_view.dart';
import 'package:rick_and_morty_sample/app/features/settings/views/settings_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(path: '/', page: HomeView, children: [
      AutoRoute(
        path: 'episodes',
        name: 'EpisodesRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: EpisodesView,
          ),
          AutoRoute(
            path: ':episodeId',
            page: EpisodeDetailView,
          ),
          AutoRoute(
            path: ':characterId',
            page: CharacterDetailView,
          ),
        ],
      ),
      AutoRoute(
        path: 'characters',
        name: 'CharactersRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: CharactersView,
          ),
          AutoRoute(
            path: ':characterId',
            page: CharacterDetailView,
          ),
          AutoRoute(
            path: ':episodeId',
            page: EpisodeDetailView,
          ),
        ],
      ),
      AutoRoute(
        path: 'locations',
        name: 'LocationsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: LocationsView,
          ),
          AutoRoute(
            path: ':locationId',
            page: LocationDetailView,
          ),
          AutoRoute(
            path: ':characterId',
            page: CharacterDetailView,
          ),
        ],
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRouter',
        page: SettingsView,
      ),
    ]),
  ],
)
class $AppRouter {}
