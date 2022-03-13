import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_filter_options.freezed.dart';

@freezed
class EpisodeFilterOptions with _$EpisodeFilterOptions {
  factory EpisodeFilterOptions({
    required String episode,
    required String name,
  }) = _EpisodeFilterOptions;
}
