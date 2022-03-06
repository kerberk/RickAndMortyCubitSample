import 'package:rick_and_morty_sample/app/constants/api_path.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/locations.dart';
import 'package:rick_and_morty_sample/app/features/locations/repository/locations_repository.dart';
import 'package:rick_and_morty_sample/app/services/network/http_service.dart';

class LocationsRestRepository implements LocationsRepository {
  final HttpService _httpService = HttpService();

  @override
  Future<Locations> getLocationsWithPage(int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      final response = await _httpService.getRequest(Uri.parse(ApiPath.getLocationsWithPage(page)));

      return Locations.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Location> getLocationById(int id) async {
    try {
      final response = await _httpService.getRequest(Uri.parse(ApiPath.getLocationById(id)));

      return Location.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Locations> getLocationsWithFilterAndPage(LocationFilterOptions locationFilterOptions, int page) async {
    try {
      if (page > 1) {
        await Future.delayed(const Duration(milliseconds: 500)); // So you can see the refreshIndicator
      }

      var filterSuffix =
          '?name=${locationFilterOptions.name}&type=${locationFilterOptions.type}&dimension=${locationFilterOptions.dimension}';

      final response =
          await _httpService.getRequest(Uri.parse(ApiPath.getLocationsWithFilterAndPage(filterSuffix, page)));

      return Locations.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
