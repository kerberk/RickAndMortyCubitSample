import 'package:flutter/material.dart';
import 'package:rick_and_morty_sample/app/constants/enums/tab_item.dart';
import 'package:rick_and_morty_sample/app/constants/keys.dart';

class TabItemData {
  const TabItemData(
      {required this.key, required this.title, required this.icon});

  final String key;
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.episodes: TabItemData(
      key: Keys.episodesTab,
      title: 'Episodes',
      icon: Icons.video_camera_front,
    ),
    TabItem.characters: TabItemData(
      key: Keys.charactersTab,
      title: 'Characters',
      icon: Icons.emoji_people,
    ),
    TabItem.locations: TabItemData(
      key: Keys.locationsTab,
      title: 'Locations',
      icon: Icons.landscape,
    ),
  };
}
