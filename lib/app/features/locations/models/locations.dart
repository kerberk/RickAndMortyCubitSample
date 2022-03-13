import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';

part 'locations.freezed.dart';
part 'locations.g.dart';

@freezed
class Locations with _$Locations {
  factory Locations({
    required Info info,
    @JsonKey(name: 'results') required List<Location> locations,
  }) = _Locations;

  factory Locations.fromJson(Map<String, dynamic> json) => _$LocationsFromJson(json);
}
