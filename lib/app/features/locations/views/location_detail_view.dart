import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/features/characters/cubits/characters_cubit.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/characters_state.dart';
import 'package:rick_and_morty_sample/app/features/characters/repositories/characters_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/locations/cubits/location_detail_cubit.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location_detail_state.dart';
import 'package:rick_and_morty_sample/app/features/locations/repositories/locations_rest_repository.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/character_item_in_details.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/circular_loading_indicator.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class LocationDetailView extends StatefulWidget implements AutoRouteWrapper {
  final int locationId;

  const LocationDetailView({
    Key? key,
    @PathParam() required this.locationId,
  }) : super(key: key);

  @override
  State<LocationDetailView> createState() => _LocationDetailViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationDetailCubit>(
          create: (context) => LocationDetailCubit(LocationsRestRepository()),
        ),
        BlocProvider<CharactersCubit>(
          create: (context) => CharactersCubit(CharactersRestRepository()),
        ),
      ],
      child: this,
    );
  }
}

class _LocationDetailViewState extends State<LocationDetailView> {
  late LocationDetailCubit _locationDetailCubit;
  late CharactersCubit _charactersCubit;

  @override
  void initState() {
    super.initState();

    _locationDetailCubit = BlocProvider.of<LocationDetailCubit>(context);
    _locationDetailCubit.getLocationById(widget.locationId);

    _charactersCubit = BlocProvider.of<CharactersCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<LocationDetailCubit, LocationDetailState>(
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
            locationLoading: () => const CircularLoadingIndicator(),
            locationLoaded: (location) => _buildLocationDetail(location),
            error: (_) => Container(),
          );
        },
      ),
    );
  }

  Widget _buildLocationDetail(Location location) {
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
                location.name,
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
                      Text('${LocaleKeys.locations_label_type.tr()}:'),
                      const SizedBox(height: 12.0),
                      Text('${LocaleKeys.locations_label_dimension.tr()}:'),
                    ],
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(location.type),
                      const SizedBox(height: 12.0),
                      Text(location.dimension),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                '${LocaleKeys.locations_label_residents.tr()}:',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
        _buildCharacters(context, location)
      ],
    );
  }

  _buildCharacters(BuildContext context, Location location) {
    var characterIds = <int>[];

    for (var character in location.residents) {
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

  _buildCharacterList(BuildContext context, List<Character> characters) {
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
