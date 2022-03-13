import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/features/characters/character_detail_view.dart';
import 'package:rick_and_morty_sample/app/features/characters/cubit/character_detail_cubit.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/episodes/cubit/episodes_cubit.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repository/episodes_rest_repository.dart';

class CharacterItemInDetails extends StatelessWidget {
  final Character _character;

  const CharacterItemInDetails(this._character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<CharacterDetailCubit>(
                create: (context) => CharacterDetailCubit(CharactersRestRepository()),
              ),
              BlocProvider<EpisodesCubit>(
                create: (context) => EpisodesCubit(EpisodesRestRepository()),
              ),
            ],
            child: CharacterDetailView(charaterId: _character.id),
          ),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        child: Row(
          children: [
            Image.network(
              _character.image,
              fit: BoxFit.cover,
              height: 60.0,
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    _character.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(_character.species),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
