part of 'location_detail_cubit.dart';

@immutable
abstract class LocationDetailState {
  const LocationDetailState();
}

class LocationDetailInitial extends LocationDetailState {
  const LocationDetailInitial();
}

class LocationDetailLoading extends LocationDetailState {
  const LocationDetailLoading();
}

class LocationDetailLoaded extends LocationDetailState {
  final Location location;

  const LocationDetailLoaded(this.location);
}

class LocationDetailError extends LocationDetailState {
  final String message;

  const LocationDetailError(this.message);
}
