// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i10;

import '../features/characters/character_detail_view.dart' as _i6;
import '../features/characters/characters_view.dart' as _i7;
import '../features/episodes/episode_detail_view.dart' as _i5;
import '../features/episodes/episodes_view.dart' as _i4;
import '../features/home/home_view.dart' as _i1;
import '../features/locations/location_detail_view.dart' as _i9;
import '../features/locations/locations_view.dart' as _i8;
import '../features/settings/settings_view.dart' as _i3;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    EpisodesRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    CharactersRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    LocationsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SettingsView());
    },
    EpisodesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EpisodesView());
    },
    EpisodeDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EpisodeDetailRouteArgs>(
          orElse: () => EpisodeDetailRouteArgs(
              episodeId: pathParams.getInt('episodeId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i5.EpisodeDetailView(key: args.key, episodeId: args.episodeId));
    },
    CharacterDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CharacterDetailRouteArgs>(
          orElse: () => CharacterDetailRouteArgs(
              charaterId: pathParams.getInt('charaterId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CharacterDetailView(
              key: args.key, charaterId: args.charaterId));
    },
    CharactersRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CharactersView());
    },
    LocationsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.LocationsView());
    },
    LocationDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LocationDetailRouteArgs>(
          orElse: () => LocationDetailRouteArgs(
              locationId: pathParams.getInt('locationId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.LocationDetailView(
              key: args.key, locationId: args.locationId));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', children: [
          _i2.RouteConfig(EpisodesRouter.name,
              path: 'episodes',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(EpisodesRoute.name,
                    path: '', parent: EpisodesRouter.name),
                _i2.RouteConfig(EpisodeDetailRoute.name,
                    path: ':episodeId', parent: EpisodesRouter.name),
                _i2.RouteConfig(CharacterDetailRoute.name,
                    path: ':characterId', parent: EpisodesRouter.name)
              ]),
          _i2.RouteConfig(CharactersRouter.name,
              path: 'characters',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(CharactersRoute.name,
                    path: '', parent: CharactersRouter.name),
                _i2.RouteConfig(CharacterDetailRoute.name,
                    path: ':characterId', parent: CharactersRouter.name),
                _i2.RouteConfig(EpisodeDetailRoute.name,
                    path: ':episodeId', parent: CharactersRouter.name)
              ]),
          _i2.RouteConfig(LocationsRouter.name,
              path: 'locations',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(LocationsRoute.name,
                    path: '', parent: LocationsRouter.name),
                _i2.RouteConfig(LocationDetailRoute.name,
                    path: ':locationId', parent: LocationsRouter.name),
                _i2.RouteConfig(CharacterDetailRoute.name,
                    path: ':characterId', parent: LocationsRouter.name)
              ]),
          _i2.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EpisodesRouter extends _i2.PageRouteInfo<void> {
  const EpisodesRouter({List<_i2.PageRouteInfo>? children})
      : super(EpisodesRouter.name, path: 'episodes', initialChildren: children);

  static const String name = 'EpisodesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CharactersRouter extends _i2.PageRouteInfo<void> {
  const CharactersRouter({List<_i2.PageRouteInfo>? children})
      : super(CharactersRouter.name,
            path: 'characters', initialChildren: children);

  static const String name = 'CharactersRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class LocationsRouter extends _i2.PageRouteInfo<void> {
  const LocationsRouter({List<_i2.PageRouteInfo>? children})
      : super(LocationsRouter.name,
            path: 'locations', initialChildren: children);

  static const String name = 'LocationsRouter';
}

/// generated route for
/// [_i3.SettingsView]
class SettingsRouter extends _i2.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i4.EpisodesView]
class EpisodesRoute extends _i2.PageRouteInfo<void> {
  const EpisodesRoute() : super(EpisodesRoute.name, path: '');

  static const String name = 'EpisodesRoute';
}

/// generated route for
/// [_i5.EpisodeDetailView]
class EpisodeDetailRoute extends _i2.PageRouteInfo<EpisodeDetailRouteArgs> {
  EpisodeDetailRoute({_i10.Key? key, required int episodeId})
      : super(EpisodeDetailRoute.name,
            path: ':episodeId',
            args: EpisodeDetailRouteArgs(key: key, episodeId: episodeId),
            rawPathParams: {'episodeId': episodeId});

  static const String name = 'EpisodeDetailRoute';
}

class EpisodeDetailRouteArgs {
  const EpisodeDetailRouteArgs({this.key, required this.episodeId});

  final _i10.Key? key;

  final int episodeId;

  @override
  String toString() {
    return 'EpisodeDetailRouteArgs{key: $key, episodeId: $episodeId}';
  }
}

/// generated route for
/// [_i6.CharacterDetailView]
class CharacterDetailRoute extends _i2.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({_i10.Key? key, required int charaterId})
      : super(CharacterDetailRoute.name,
            path: ':characterId',
            args: CharacterDetailRouteArgs(key: key, charaterId: charaterId),
            rawPathParams: {'charaterId': charaterId});

  static const String name = 'CharacterDetailRoute';
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({this.key, required this.charaterId});

  final _i10.Key? key;

  final int charaterId;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{key: $key, charaterId: $charaterId}';
  }
}

/// generated route for
/// [_i7.CharactersView]
class CharactersRoute extends _i2.PageRouteInfo<void> {
  const CharactersRoute() : super(CharactersRoute.name, path: '');

  static const String name = 'CharactersRoute';
}

/// generated route for
/// [_i8.LocationsView]
class LocationsRoute extends _i2.PageRouteInfo<void> {
  const LocationsRoute() : super(LocationsRoute.name, path: '');

  static const String name = 'LocationsRoute';
}

/// generated route for
/// [_i9.LocationDetailView]
class LocationDetailRoute extends _i2.PageRouteInfo<LocationDetailRouteArgs> {
  LocationDetailRoute({_i10.Key? key, required int locationId})
      : super(LocationDetailRoute.name,
            path: ':locationId',
            args: LocationDetailRouteArgs(key: key, locationId: locationId),
            rawPathParams: {'locationId': locationId});

  static const String name = 'LocationDetailRoute';
}

class LocationDetailRouteArgs {
  const LocationDetailRouteArgs({this.key, required this.locationId});

  final _i10.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationDetailRouteArgs{key: $key, locationId: $locationId}';
  }
}
