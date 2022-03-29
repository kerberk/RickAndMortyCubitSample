import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/features/locations/cubits/locations_cubit.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/locations_state.dart';
import 'package:rick_and_morty_sample/app/features/locations/repositories/locations_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/settings/views/settings_view.dart';
import 'package:rick_and_morty_sample/app/routes/router.gr.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/circular_loading_indicator.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class LocationsView extends StatefulWidget implements AutoRouteWrapper {
  const LocationsView({Key? key}) : super(key: key);

  @override
  State<LocationsView> createState() => _LocationsViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LocationsCubit>(
      create: (context) => LocationsCubit(LocationsRestRepository()),
      child: this,
    );
  }
}

class _LocationsViewState extends State<LocationsView> {
  final scrollController = ScrollController();
  final TextEditingController _searchNameTextController = TextEditingController();
  final TextEditingController _searchTypeTextController = TextEditingController();
  final TextEditingController _searchDimensionTextController = TextEditingController();

  late LocationsCubit _locationsCubitBloc;

  @override
  void initState() {
    super.initState();
    _locationsCubitBloc = BlocProvider.of<LocationsCubit>(context);

    _locationsCubitBloc.getLocations();

    _setupScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.locations_appbar_title.tr()),
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
          Visibility(
            visible: _locationsCubitBloc.showFilterOptions,
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildSearchInput(context, _searchNameTextController, LocaleKeys.locations_hints_search_name.tr()),
                const SizedBox(height: 12),
                _buildSearchInput(context, _searchTypeTextController, LocaleKeys.locations_hints_search_type.tr()),
                const SizedBox(height: 12),
                _buildSearchInput(
                    context, _searchDimensionTextController, LocaleKeys.locations_hints_search_dimension.tr()),
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

  Widget _buildFilterButton() {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        _locationsCubitBloc.filterLocations(
          _searchNameTextController.text,
          _searchTypeTextController.text,
          _searchDimensionTextController.text,
        );
      },
      child: Text(LocaleKeys.locations_buttons_search.tr()),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: BlocConsumer<LocationsCubit, LocationsState>(
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
          bool isLoading = false;

          return state.when(
            initializing: () => const CircularLoadingIndicator(),
            locationsLoading: (oldLocations, isFirstLoad) {
              if (isFirstLoad) {
                return const CircularLoadingIndicator();
              } else {
                isLoading = true;
                return _buildLocationsList(oldLocations, isLoading);
              }
            },
            locationsLoaded: (locations) => _buildLocationsList(locations, isLoading),
            error: (_) => Container(),
          );
        },
      ),
    );
  }

  Widget _buildLocationsList(List<Location> locations, bool isLoading) {
    List<Widget> listTiles = [];

    for (var location in locations) {
      listTiles.add(
        ListTile(
          title: Text(location.name),
        ),
      );
    }

    return Scrollbar(
      child: ListView.separated(
        controller: scrollController,
        itemCount: locations.length + (isLoading ? 1 : 0),
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemBuilder: (context, index) {
          if (index < locations.length) {
            return _locationItem(context, locations[index]);
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

  Widget _locationItem(BuildContext context, Location location) {
    return InkWell(
      onTap: () => context.router.push(LocationDetailRoute(locationId: location.id)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    location.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [Text(location.type), const SizedBox(width: 12.0), Text(location.dimension)],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
        if (_locationsCubitBloc.isFilterActive) {
          _locationsCubitBloc.filterLocations(
            _searchNameTextController.text,
            _searchTypeTextController.text,
            _searchDimensionTextController.text,
          );
        } else {
          _locationsCubitBloc.getLocations();
        }
      }
    });
  }

  void _toggleFilter() {
    _locationsCubitBloc.showFilterOptions = !_locationsCubitBloc.showFilterOptions;
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
    _searchTypeTextController.dispose();
    _searchDimensionTextController.dispose();

    super.dispose();
  }
}
