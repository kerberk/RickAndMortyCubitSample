enum CharacterGender {
  male,
  female,
  genderless,
  unknown,
}

extension ParseToString on CharacterGender {
  String toShortString() {
    return toString().split('.').last;
  }
}
