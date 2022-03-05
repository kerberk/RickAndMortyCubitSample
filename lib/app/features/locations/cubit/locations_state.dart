part of 'locations_cubit.dart';

@immutable
abstract class LocationsState {
  const LocationsState();
}

class LocationsInitial extends LocationsState {
  const LocationsInitial();
}

class LocationsLoading extends LocationsState {
  final List<Location> oldLocations;
  final bool isFirstLoad;

  const LocationsLoading(this.oldLocations, {this.isFirstLoad = false});
}

class LocationsLoaded extends LocationsState {
  final List<Location> locations;

  const LocationsLoaded(this.locations);
}

class LocationsError extends LocationsState {
  final String message;

  const LocationsError(this.message);
}
