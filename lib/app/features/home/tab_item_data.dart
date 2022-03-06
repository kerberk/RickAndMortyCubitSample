import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_sample/app/constants/enums/tab_item.dart';
import 'package:rick_and_morty_sample/app/constants/keys.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class TabItemData {
  const TabItemData({required this.key, required this.title, required this.icon});

  final String key;
  final String title;
  final IconData icon;

  static Map<TabItem, TabItemData> allTabs = {
    TabItem.episodes: TabItemData(
      key: Keys.episodesTab,
      title: LocaleKeys.home_tab_episodes.tr(),
      icon: Icons.video_camera_front,
    ),
    TabItem.characters: TabItemData(
      key: Keys.charactersTab,
      title: LocaleKeys.home_tab_characters.tr(),
      icon: Icons.emoji_people,
    ),
    TabItem.locations: TabItemData(
      key: Keys.locationsTab,
      title: LocaleKeys.home_tab_locales.tr(),
      icon: Icons.landscape,
    ),
  };
}
