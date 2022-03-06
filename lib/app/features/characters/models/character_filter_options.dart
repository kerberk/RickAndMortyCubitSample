import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_filter_options.freezed.dart';

@freezed
class CharacterFilterOptions with _$CharacterFilterOptions {
  factory CharacterFilterOptions({
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
  }) = _CharacterFilterOptions;
}
