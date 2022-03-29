import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_sample/app/constants/enums/tab_item.dart';
import 'package:rick_and_morty_sample/app/features/home/widgets/tab_item_data.dart';
import 'package:rick_and_morty_sample/app/routes/router.gr.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        EpisodesRouter(),
        CharactersRouter(),
        LocationsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        items: [
          _buildItem(TabItem.episodes),
          _buildItem(TabItem.characters),
          _buildItem(TabItem.locations),
        ],
        onTap: tabsRouter.setActiveIndex,
        currentIndex: tabsRouter.activeIndex,
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

  @override
  void dispose() {
    super.dispose();
  }
}
