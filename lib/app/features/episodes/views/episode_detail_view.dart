import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/features/characters/cubits/characters_cubit.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/characters_state.dart';
import 'package:rick_and_morty_sample/app/features/characters/repositories/characters_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/episodes/cubits/episode_detail_cubit.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode_detail_state.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repositories/episodes_rest_repository.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/character_item_in_details.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/circular_loading_indicator.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class EpisodeDetailView extends StatefulWidget implements AutoRouteWrapper {
  final int episodeId;

  const EpisodeDetailView({
    Key? key,
    @PathParam() required this.episodeId,
  }) : super(key: key);

  @override
  State<EpisodeDetailView> createState() => _EpisodeDetailViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EpisodeDetailCubit>(
          create: (context) => EpisodeDetailCubit(EpisodesRestRepository()),
        ),
        BlocProvider<CharactersCubit>(
          create: (context) => CharactersCubit(CharactersRestRepository()),
        ),
      ],
      child: this,
    );
  }
}

class _EpisodeDetailViewState extends State<EpisodeDetailView> {
  late EpisodeDetailCubit _episodeDetailCubit;
  late CharactersCubit _charactersCubit;

  @override
  void initState() {
    super.initState();

    _episodeDetailCubit = BlocProvider.of<EpisodeDetailCubit>(context);
    _episodeDetailCubit.getEpisodeById(id: widget.episodeId);

    _charactersCubit = BlocProvider.of<CharactersCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<EpisodeDetailCubit, EpisodeDetailState>(
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
          return state.when(
            initializing: () => const CircularLoadingIndicator(),
            episodeLoading: () => const CircularLoadingIndicator(),
            episodeLoaded: (episode) => _buildEpisodeDetail(episode),
            error: (_) => Container(),
          );
        },
      ),
    );
  }

  Widget _buildEpisodeDetail(Episode episode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Text(
                episode.name,
                style: const TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${LocaleKeys.episodes_label_episode.tr()}:'),
                      const SizedBox(height: 12.0),
                      Text('${LocaleKeys.episodes_label_air_date.tr()}:'),
                    ],
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(episode.episode),
                      const SizedBox(height: 12.0),
                      Text(episode.airDate),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                '${LocaleKeys.episodes_label_characters_in_episode.tr()}:',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
        _buildCharacters(context, episode)
      ],
    );
  }

  Widget _buildCharacters(BuildContext context, Episode episode) {
    var characterIds = <int>[];

    for (var character in episode.characters) {
      var characterId = int.tryParse(character.split('/').last);
      if (characterId != null) {
        characterIds.add(characterId);
      }
    }

    _charactersCubit.getMultipleCharacters(characterIds);

    return BlocConsumer<CharactersCubit, CharactersState>(
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
        return state.when(
          initializing: () => const CircularLoadingIndicator(),
          charactersLoading: (_, __) => const CircularLoadingIndicator(),
          charactersLoaded: (characters) => _buildCharacterList(context, characters),
          error: (_) => Container(),
        );
      },
    );
  }

  Widget _buildCharacterList(BuildContext context, List<Character> characters) {
    return Expanded(
      child: ListView.separated(
        itemCount: characters.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemBuilder: (context, index) {
          if (index < characters.length) {
            return CharacterItemInDetails(characters[index]);
          }

          return Container();
        },
      ),
    );
  }
}
