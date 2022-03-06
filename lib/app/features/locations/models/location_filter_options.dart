import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_filter_options.freezed.dart';

@freezed
class LocationFilterOptions with _$LocationFilterOptions {
  factory LocationFilterOptions({
    required String name,
    required String type,
    required String dimension,
  }) = _LocationFilterOptions;
}
