import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';

part 'characters.freezed.dart';
part 'characters.g.dart';

@freezed
class Characters with _$Characters {
  factory Characters({
    required Info info,
    required List<Character> characters,
  }) = _Characters;

  factory Characters.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);
}
