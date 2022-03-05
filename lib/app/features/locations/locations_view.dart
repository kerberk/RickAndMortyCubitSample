import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_sample/app/features/characters/cubit/characters_cubit.dart';
import 'package:rick_and_morty_sample/app/features/characters/repository/characters_rest_repository.dart';
import 'package:rick_and_morty_sample/app/features/locations/cubit/location_detail_cubit.dart';
import 'package:rick_and_morty_sample/app/features/locations/cubit/locations_cubit.dart';
import 'package:rick_and_morty_sample/app/features/locations/location_detail_view.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/repository/locations_rest_repository.dart';
import 'package:rick_and_morty_sample/app/shared/widgets/circular_loading_indicator.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({Key? key}) : super(key: key);

  @override
  State<LocationsView> createState() => _LocationsViewState();
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
        title: const Text('Locations'),
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
                _buildSearchInput(context, _searchNameTextController, 'Search for a name'),
                const SizedBox(height: 12),
                _buildSearchInput(context, _searchTypeTextController, 'Search for a type'),
                const SizedBox(height: 12),
                _buildSearchInput(context, _searchDimensionTextController, 'Search for a dimension'),
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
      child: const Text('Search'),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: BlocConsumer<LocationsCubit, LocationsState>(
        listener: (context, state) {
          if (state is LocationsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          bool isLoading = false;

          if (state is LocationsInitial) {
            return const CircularLoadingIndicator();
          }

          if (state is LocationsLoading) {
            if (state.isFirstLoad) {
              return const CircularLoadingIndicator();
            } else {
              isLoading = true;
              return _buildLocationsList(state.oldLocations, isLoading);
            }
          }

          if (state is LocationsLoaded) {
            return _buildLocationsList(state.locations, isLoading);
          }

          return Container();
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
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<LocationDetailCubit>(
                create: (context) => LocationDetailCubit(LocationsRestRepository(), location.id),
              ),
              BlocProvider<CharactersCubit>(
                create: (context) => CharactersCubit(CharactersRestRepository()),
              ),
            ],
            child: const LocationDetailView(),
          ),
        ),
      ),
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

  @override
  void dispose() {
    _searchNameTextController.dispose();
    _searchTypeTextController.dispose();
    _searchDimensionTextController.dispose();

    super.dispose();
  }
}