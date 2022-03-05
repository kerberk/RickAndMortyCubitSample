import 'package:rick_and_morty_sample/app/features/characters/models/character.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';

class Characters {
  Characters({
    required this.info,
    required this.characters,
  });

  final Info info;
  final List<Character> characters;

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        info: Info.fromJson(json["info"]),
        characters: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(characters.map((x) => x.toJson())),
      };
}
