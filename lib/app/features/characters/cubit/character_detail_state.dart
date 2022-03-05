part of 'character_detail_cubit.dart';

@immutable
abstract class CharacterDetailState {
  const CharacterDetailState();
}

class CharacterDetailInitial extends CharacterDetailState {
  const CharacterDetailInitial();
}

class CharacterDetailLoading extends CharacterDetailState {
  const CharacterDetailLoading();
}

class CharacterDetailLoaded extends CharacterDetailState {
  final Character character;

  const CharacterDetailLoaded(this.character);
}

class CharacterDetailError extends CharacterDetailState {
  final String message;

  const CharacterDetailError(this.message);
}
