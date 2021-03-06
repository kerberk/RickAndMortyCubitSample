import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/constants/enums/character_status.dart';
import 'package:rick_and_morty_sample/app/features/characters/cubits/character_detail_cubit.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character_detail_state.dart';
import 'package:rick_and_morty_sample/app/features/characters/repositories/characters_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/episodes/cubits/episodes_cubit.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episode.dart';
import 'package:rick_and_morty_sample/app/features/episodes/models/episodes_state.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repositories/episodes_rest_repository.dart';
import 'package:rick_and_morty_sample/app/routes/router.gr.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/circular_loading_indicator.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class CharacterDetailView extends StatefulWidget implements AutoRouteWrapper {
  final int charaterId;

  const CharacterDetailView({
    Key? key,
    @PathParam() required this.charaterId,
  }) : super(key: key);

  @override
  State<CharacterDetailView> createState() => _CharacterDetailViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterDetailCubit>(
          create: (context) => CharacterDetailCubit(CharactersRestRepository()),
        ),
        BlocProvider<EpisodesCubit>(
          create: (context) => EpisodesCubit(EpisodesRestRepository()),
        ),
      ],
      child: this,
    );
  }
}

class _CharacterDetailViewState extends State<CharacterDetailView> {
  late CharacterDetailCubit _characterDetailCubitBloc;
  late EpisodesCubit _episodesCubit;

  @override
  void initState() {
    super.initState();

    _characterDetailCubitBloc = BlocProvider.of<CharacterDetailCubit>(context);
    _characterDetailCubitBloc.getCharacterById(widget.charaterId);

    _episodesCubit = BlocProvider.of<EpisodesCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CharacterDetailCubit, CharacterDetailState>(
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
            characterLoading: () => const CircularLoadingIndicator(),
            characterLoaded: (character) => _buildCharacterDetail(context, character),
            error: (_) => Container(),
          );
        },
      ),
    );
  }

  Widget _buildCharacterDetail(BuildContext context, Character character) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          character.image,
          width: screenWidth,
          height: 250.0,
          fit: BoxFit.cover,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Visibility(
                    visible: character.status.toLowerCase() == CharacterStatus.dead.toShortString().toLowerCase(),
                    child: Image.network(
                      'https://img.icons8.com/ios-filled/50/000000/headstone.png',
                      height: 36.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${LocaleKeys.characters_label_gender.tr()}:'),
                      const SizedBox(height: 12.0),
                      Text('${LocaleKeys.characters_label_species.tr()}:'),
                      Visibility(
                        visible: character.type != '',
                        child: Column(
                          children: [
                            const SizedBox(height: 12.0),
                            Text('${LocaleKeys.characters_label_type.tr()}:'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text('${LocaleKeys.characters_label_origin.tr()}:'),
                      const SizedBox(height: 12.0),
                      Text('${LocaleKeys.characters_label_location.tr()}:'),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(character.gender),
                      const SizedBox(height: 12.0),
                      Text(character.species),
                      Visibility(
                        visible: character.type != '',
                        child: Column(
                          children: [
                            const SizedBox(height: 12.0),
                            Text(character.type),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(character.origin.name),
                      const SizedBox(height: 12.0),
                      Text(character.location.name),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Text(
                '${LocaleKeys.characters_label_episodes.tr()}:',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        _buildEpisodes(context, character),
      ],
    );
  }

  Widget _buildEpisodes(BuildContext context, Character character) {
    var episodeIds = <int>[];

    for (var episode in character.episode) {
      var episodeId = int.tryParse(episode.split('/').last);
      if (episodeId != null) {
        episodeIds.add(episodeId);
      }
    }

    _episodesCubit.getMultipleEpisodes(episodeIds);

    return BlocConsumer<EpisodesCubit, EpisodesState>(
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
          episodesLoading: (_, __) => const CircularLoadingIndicator(),
          episodesLoaded: (episodes) => _buildEpisodeList(context, episodes),
          error: (_) => Container(),
        );
      },
    );
  }

  Widget _buildEpisodeList(BuildContext context, List<Episode> episodes) {
    return Expanded(
      child: ListView.separated(
        itemCount: episodes.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemBuilder: (context, index) {
          if (index < episodes.length) {
            return _episodeItem(context, episodes[index]);
          }

          return Container();
        },
      ),
    );
  }

  Widget _episodeItem(BuildContext context, Episode episode) {
    return InkWell(
      onTap: () => context.router.push(EpisodeDetailRoute(episodeId: episode.id)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
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
                  fontSize: 14.0,
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
}
