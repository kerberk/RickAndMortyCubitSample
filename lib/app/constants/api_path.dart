class ApiPath {
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  static const String character = 'character';
  static const String episode = 'episode';
  static const String location = 'location';

  static String getCharactersWithPage(int page) => '$baseUrl/$character/?page=$page';
  static String getCharacterById(int id) => '$baseUrl/$character/$id';
  static String getCharactersByIds(List<int> ids) => '$baseUrl/$character/$ids';
  static String getCharactersWithFilterAndPage(String filterSuffix, int page) =>
      '$baseUrl/character/$filterSuffix&page=$page';

  static String getEpisodesWithPage(int page) => '$baseUrl/$episode/?page=$page';
  static String getEpisodeById(int id) => '$baseUrl/$episode/$id';
  static String getEpisodesByIds(List<int> ids) => '$baseUrl/$episode/$ids';
  static String getEpisodesWithFilterAndPage(String filterSuffix, int page) =>
      '$baseUrl/$episode/$filterSuffix&page=$page';

  static String getLocationsWithPage(int page) => '$baseUrl/$location/?page=$page';
  static String getLocationById(int id) => '$baseUrl/$location/$id';
  static String getLocationsByIds(List<int> ids) => '$baseUrl/$location/$ids';
  static String getLocationsWithFilterAndPage(String filterSuffix, int page) =>
      '$baseUrl/$location/$filterSuffix&page=$page';
}
