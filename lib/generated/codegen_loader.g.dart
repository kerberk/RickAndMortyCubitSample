// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> de_DE = {
  "home": {
    "tab_episodes": "Episoden",
    "tab_characters": "Charaktere",
    "tab_locales": "Orte"
  },
  "characters": {
    "appbar_title": "Charaktere",
    "label_gender": "Geschlecht",
    "label_species": "Spezies",
    "label_type": "Typ",
    "label_origin": "Herkunft",
    "label_location": "Ort",
    "label_episodes": "Episoden",
    "hints": {
      "search_name": "Suche nach Namen",
      "search_species": "Suche nach Spezien",
      "search_type": "Suche nach Typen",
      "dropdown": "Bitte wählen"
    },
    "buttons": {
      "search": "Suchen"
    }
  },
  "episodes": {
    "appbar_title": "Episoden",
    "label_episode": "Episode",
    "label_air_date": "Erstausstrahlung",
    "label_characters_in_episode": "Charaktere in dieser Episode",
    "hints": {
      "search_name": "Suche nach Namen",
      "search_episode": "Suche nach Episoden"
    },
    "buttons": {
      "search": "Suchen"
    }
  },
  "locations": {
    "appbar_title": "Locations",
    "label_type": "Typ",
    "label_dimension": "Dimension",
    "label_residents": "Bewohner dieses Ortes",
    "hints": {
      "search_name": "Search for a name",
      "search_type": "Search for a type",
      "search_dimension": "Search for a dimension"
    },
    "buttons": {
      "search": "Search"
    }
  },
  "settings": {
    "appbar_title": "Einstellungen",
    "dropdown_label_set_language": "Sprache wählen",
    "dropdown_item_english": "Englisch",
    "dropdown_item_german": "Deutsch",
    "hints": {
      "dropdown": "Bitte wählen"
    }
  },
  "error_loading_data": "Fehler beim Laden der Daten"
};
static const Map<String,dynamic> en_US = {
  "home": {
    "tab_episodes": "Episodes",
    "tab_characters": "Characters",
    "tab_locales": "Locales"
  },
  "characters": {
    "appbar_title": "Characters",
    "label_gender": "Gender",
    "label_species": "Species",
    "label_type": "Type",
    "label_origin": "Origin",
    "label_location": "Location",
    "label_episodes": "Episodes",
    "hints": {
      "search_name": "Search for a name",
      "search_species": "Search for a species",
      "search_type": "Search for a type",
      "dropdown": "Please choose"
    },
    "buttons": {
      "search": "Search"
    }
  },
  "episodes": {
    "appbar_title": "Episodes",
    "label_episode": "Episode",
    "label_air_date": "Air Date",
    "label_characters_in_episode": "Characters in this episode",
    "hints": {
      "search_name": "Search for a name",
      "search_episode": "Search for a episode"
    },
    "buttons": {
      "search": "Search"
    }
  },
  "locations": {
    "appbar_title": "Locations",
    "label_type": "Type",
    "label_dimension": "Dimension",
    "label_residents": "Residents of this location",
    "hints": {
      "search_name": "Search for a name",
      "search_type": "Search for a type",
      "search_dimension": "Search for a dimension"
    },
    "buttons": {
      "search": "Search"
    }
  },
  "settings": {
    "appbar_title": "Settings",
    "dropdown_label_set_language": "Choose language",
    "dropdown_item_english": "English",
    "dropdown_item_german": "German",
    "hints": {
      "dropdown": "Please choose"
    }
  },
  "error_loading_data": "Couldn't load data"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"de_DE": de_DE, "en_US": en_US};
}
