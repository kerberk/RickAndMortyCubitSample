import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';

part 'locations_state.freezed.dart';

@freezed
class LocationsState with _$LocationsState {
  const factory LocationsState.initializing() = _Initializing;
  const factory LocationsState.locationsLoading(List<Location> oldLocations, {@Default(false) bool isFirstLoad}) =
      _LocationsLoading;
  const factory LocationsState.locationsLoaded(List<Location> locations) = _LocationsLoaded;
  const factory LocationsState.error(String message) = _Error;
}
