part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {
  const CharactersState();
}

class CharactersInitial extends CharactersState {
  const CharactersInitial();
}

class CharactersLoading extends CharactersState {
  final List<Character> oldCharacters;
  final bool isFirstLoad;

  const CharactersLoading(this.oldCharacters, {this.isFirstLoad = false});
}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  const CharactersLoaded(this.characters);
}

class CharactersError extends CharactersState {
  final String message;

  const CharactersError(this.message);
}
