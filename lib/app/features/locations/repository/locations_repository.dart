import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/locations.dart';

abstract class LocationsRepository {
  Future<Locations> getLocationsWithPage(int page);

  Future<Location> getLocationById(int id);

  Future<Locations> getLocationsWithFilterAndPage(LocationFilterOptions locationFilterOptions, int page);
}
