import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/constants/enums/tab_item.dart';
import 'package:rick_and_morty_sample/app/features/characters/characters_view.dart';
import 'package:rick_and_morty_sample/app/features/characters/cubit/characters_cubit.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/episodes/cubit/episodes_cubit.dart';
import 'package:rick_and_morty_sample/app/features/episodes/episodes_view.dart';
import 'package:rick_and_morty_sample/app/features/episodes/repository/episodes_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/home/tab_item_data.dart';
import 'package:rick_and_morty_sample/app/features/locations/cubit/locations_cubit.dart';
import 'package:rick_and_morty_sample/app/features/locations/locations_view.dart';
import 'package:rick_and_morty_sample/app/features/locations/repository/locations_rest_repository.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    BlocProvider<EpisodesCubit>(
      create: (context) => EpisodesCubit(EpisodesRestRepository()),
      child: const EpisodesView(),
    ),
    BlocProvider<CharactersCubit>(
      create: (context) => CharactersCubit(CharactersRestRepository()),
      child: const CharactersView(),
    ),
    BlocProvider<LocationsCubit>(
      create: (context) => LocationsCubit(LocationsRestRepository()),
      child: const LocationsView(),
    )
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildItem(TabItem.episodes),
          _buildItem(TabItem.characters),
          _buildItem(TabItem.locations),
        ],
        onTap: navigateToPage,
        currentIndex: _currentIndex,
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem]!;
    return BottomNavigationBarItem(
      icon: Icon(itemData.icon),
      label: itemData.title,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  void navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
