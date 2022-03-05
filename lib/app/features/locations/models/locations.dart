import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';

class Locations {
  Locations({
    required this.info,
    required this.locations,
  });

  final Info info;
  final List<Location> locations;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        info: Info.fromJson(json["info"]),
        locations: List<Location>.from(json["results"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(locations.map((x) => x.toJson())),
      };
}
