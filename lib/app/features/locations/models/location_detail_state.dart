import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';

part 'location_detail_state.freezed.dart';

@freezed
class LocationDetailState with _$LocationDetailState {
  const factory LocationDetailState.initializing() = _Initializing;
  const factory LocationDetailState.locationLoading() = _LocationLoading;
  const factory LocationDetailState.locationLoaded(Location location) = _LocationLoaded;
  const factory LocationDetailState.error(String message) = _Error;
}
