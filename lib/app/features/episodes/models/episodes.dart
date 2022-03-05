import 'package:rick_and_morty_sample/app/shared/models/info.dart';

import 'episode.dart';

class Episodes {
  Episodes({
    required this.info,
    required this.episodes,
  });

  final Info info;
  final List<Episode> episodes;

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        info: Info.fromJson(json["info"]),
        episodes: List<Episode>.from(json["results"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(episodes.map((x) => x.toJson())),
      };
}
