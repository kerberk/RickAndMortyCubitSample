import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';

import 'episode.dart';

part 'episodes.freezed.dart';
part 'episodes.g.dart';

@freezed
class Episodes with _$Episodes {
  factory Episodes({
    required Info info,
    required List<Episode> episodes,
  }) = _Episodes;

  factory Episodes.fromJson(Map<String, dynamic> json) => _$EpisodesFromJson(json);
}
