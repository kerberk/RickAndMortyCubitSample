enum CharacterStatus {
  alive,
  dead,
  unknown,
}

extension ParseToString on CharacterStatus {
  String toShortString() {
    return toString().split('.').last;
  }
}
