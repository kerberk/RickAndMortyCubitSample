import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/constants/enums/character_gender.dart';
import 'package:rick_and_morty_sample/app/constants/enums/character_status.dart';
import 'package:rick_and_morty_sample/app/features/characters/cubit/character_detail_cubit.dart';
import 'package:rick_and_morty_sample/app/features/characters/cubit/characters_cubit.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/episodes/cubit/episodes_cubit.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repository/episodes_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/settings/settings_view.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/circular_loading_indicator.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

import 'character_detail_view.dart';

class CharactersView extends StatefulWidget implements AutoRouteWrapper {
  const CharactersView({Key? key}) : super(key: key);

  @override
  State<CharactersView> createState() => _CharactersViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CharactersCubit>(
      create: (context) => CharactersCubit(CharactersRestRepository()),
      child: this,
    );
  }
}

class _CharactersViewState extends State<CharactersView> {
  final scrollController = ScrollController();
  final TextEditingController _searchNameTextController = TextEditingController();
  final TextEditingController _searchSpeciesTextController = TextEditingController();
  final TextEditingController _searchTypeTextController = TextEditingController();

  String _selectedCharacterStatus = '';
  String _selectedCharacterGender = '';

  late CharactersCubit _charactersCubitBloc;

  @override
  void initState() {
    super.initState();
    _charactersCubitBloc = BlocProvider.of<CharactersCubit>(context);

    _charactersCubitBloc.getCharacters();

    _setupScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.characters_appbar_title.tr()),
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
          const SizedBox(height: 16),
          Visibility(
            visible: _charactersCubitBloc.showFilterOptions,
            child: Column(
              children: [
                _buildSearchInput(context, _searchNameTextController, LocaleKeys.characters_hints_search_name.tr()),
                const SizedBox(height: 12),
                _buildSearchInput(
                    context, _searchSpeciesTextController, LocaleKeys.characters_hints_search_species.tr()),
                const SizedBox(height: 12),
                _buildSearchInput(context, _searchTypeTextController, LocaleKeys.characters_hints_search_type.tr()),
                const SizedBox(height: 12),
                _buildStatusFilterDropdown(context),
                const SizedBox(height: 12),
                _buildGenderFilterDropdown(context),
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

  Widget _buildStatusFilterDropdown(BuildContext context) {
    var dropDownMenuItems = <DropdownMenuItem<String>>[];
    dropDownMenuItems.add(DropdownMenuItem(value: '', child: Text(LocaleKeys.characters_hints_dropdown.tr())));
    dropDownMenuItems.addAll(
      CharacterStatus.values.map((CharacterStatus characterStatus) {
        return DropdownMenuItem<String>(
            value: characterStatus.toShortString(),
            child: Text(
              characterStatus.toShortString(),
            ));
      }).toList(),
    );

    return DropdownButton<String>(
      value: _selectedCharacterStatus,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedCharacterStatus = newValue;
          });
        }
      },
      items: dropDownMenuItems,
    );
  }

  Widget _buildGenderFilterDropdown(BuildContext context) {
    var dropDownMenuItems = <DropdownMenuItem<String>>[];
    dropDownMenuItems.add(DropdownMenuItem(value: '', child: Text(LocaleKeys.characters_hints_dropdown.tr())));
    dropDownMenuItems.addAll(
      CharacterGender.values.map((CharacterGender characterGender) {
        return DropdownMenuItem<String>(
            value: characterGender.toShortString(), child: Text(characterGender.toShortString()));
      }).toList(),
    );

    return DropdownButton<String>(
      value: _selectedCharacterGender,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedCharacterGender = newValue;
          });
        }
      },
      items: dropDownMenuItems,
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

        BlocProvider.of<CharactersCubit>(context).filterCharacters(
          _searchNameTextController.text,
          _selectedCharacterStatus.toString(),
          _searchSpeciesTextController.text,
          _searchTypeTextController.text,
          _selectedCharacterGender.toString(),
        );
      },
      child: Text(LocaleKeys.characters_buttons_search.tr()),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: BlocConsumer<CharactersCubit, CharactersState>(
        listener: (context, state) {
          if (state is CharactersError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          bool isLoading = false;

          if (state is CharactersInitial) {
            return const CircularLoadingIndicator();
          }

          if (state is CharactersLoading) {
            if (state.isFirstLoad) {
              return const CircularLoadingIndicator();
            } else {
              isLoading = true;
              return _buildCharactersList(state.oldCharacters, isLoading);
            }
          }

          if (state is CharactersLoaded) {
            return _buildCharactersList(state.characters, isLoading);
          }

          return Container();
        },
      ),
    );
  }

  Widget _buildCharactersList(List<Character> characters, bool isLoading) {
    List<Widget> listTiles = [];

    for (var character in characters) {
      listTiles.add(
        ListTile(
          title: Text(character.name),
        ),
      );
    }

    return Scrollbar(
      child: ListView.separated(
        controller: scrollController,
        itemCount: characters.length + (isLoading ? 1 : 0),
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemBuilder: (context, index) {
          if (index < characters.length) {
            return _characterItem(context, characters[index]);
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

  Widget _characterItem(BuildContext context, Character character) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
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
              child: CharacterDetailView(charaterId: character.id),
            ),
          ),
        ),
        child: Row(
          children: [
            Image.network(
              character.image,
              fit: BoxFit.cover,
              height: 100.0,
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
                    character.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(character.species),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
        if (_charactersCubitBloc.isFilterActive) {
          _charactersCubitBloc.filterCharacters(
            _searchNameTextController.text,
            _selectedCharacterStatus.toString(),
            _searchSpeciesTextController.text,
            _searchTypeTextController.text,
            _selectedCharacterGender.toString(),
          );
        } else {
          _charactersCubitBloc.getCharacters();
        }
      }
    });
  }

  void _toggleFilter() {
    _charactersCubitBloc.showFilterOptions = !_charactersCubitBloc.showFilterOptions;
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
    _searchNameTextController.dispose();
    _searchSpeciesTextController.dispose();
    _searchTypeTextController.dispose();

    super.dispose();
  }
}
