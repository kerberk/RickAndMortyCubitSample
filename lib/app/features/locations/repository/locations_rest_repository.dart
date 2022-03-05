import 'dart:convert';

import 'package:http/http.dart';
import 'package:rick_and_morty_sample/app/constants/strings.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/locations.dart';
import 'package:rick_and_morty_sample/app/features/locations/repository/locations_repository.dart';

class LocationsRestRepository implements LocationsRepository {
  @override
  Future<Location> getLocationById(int id) async {
    try {
      final response = await get(Uri.parse('${Strings.baseUrl}/location/$id'));
      return Location.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Locations> getLocations(int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      final response = await get(Uri.parse('${Strings.baseUrl}/location/?page=$page'));

      return Locations.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Locations> getFilteredLocations(LocationFilterOptions locationFilterOptions, int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      var filterSuffix =
          '?name=${locationFilterOptions.name}&type=${locationFilterOptions.type}&dimension=${locationFilterOptions.dimension}&page=$page';

      final response = await get(Uri.parse('${Strings.baseUrl}/location/$filterSuffix'));
      return Locations.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
