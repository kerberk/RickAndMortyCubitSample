import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location_filter_options.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/locations_state.dart';
import 'package:rick_and_morty_sample/app/features/locations/repositories/locations_repository.dart';
import 'package:rick_and_morty_sample/app/shared/models/info.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class LocationsCubit extends Cubit<LocationsState> {
  final LocationsRepository _locationsRepository;

  int _locationsPage = 1;
  int _filteredLocationsPage = 1;

  bool _isFilterActive = false;

  LocationFilterOptions _lastFilterOptions = LocationFilterOptions(name: '', type: '', dimension: '');

  Info _allLocationsInfo = Info(count: 0, pages: 0);
  List<Location> _locations = [];

  bool showFilterOptions = false;

  LocationsCubit(this._locationsRepository) : super(const LocationsState.initializing());

  bool get isFilterActive => _isFilterActive;

  Future<void> getLocations() async {
    try {
      if (state.maybeWhen(locationsLoading: (_, __) => true, orElse: () => false)) return;
      if (_allLocationsInfo.pages != 0 && _allLocationsInfo.pages <= _locationsPage) return;

      _filteredLocationsPage = 1;
      _isFilterActive = false;

      final currentState = state;

      var oldLocations = <Location>[];
      if (currentState.maybeWhen(locationsLoaded: (_) => true, orElse: () => false)) {
        oldLocations = currentState.maybeWhen(locationsLoaded: (locations) => locations, orElse: () => []);
      }

      emit(LocationsState.locationsLoading(oldLocations, isFirstLoad: _locationsPage == 1));

      var result = await _locationsRepository.getLocationsWithPage(_locationsPage);

      _allLocationsInfo = result.info;
      _locations.addAll(result.locations);

      emit(LocationsState.locationsLoaded(_locations));

      _locationsPage++;
    } catch (e) {
      emit(LocationsState.error(LocaleKeys.error_loading_data.tr()));
    }
  }

  Future<void> filterLocations(String name, String type, String dimension) async {
    try {
      // If state is already loading -> return
      if (state.maybeWhen(locationsLoading: (_, __) => true, orElse: () => false)) return;

      // If filter are empty -> get episodes without filter
      if (name == '' && type == '' && dimension == '') {
        _locations = [];
        _allLocationsInfo = Info(count: 0, pages: 0);
        getLocations();
        return;
      }

      // If filtered input is new -> reset filter data
      if (_lastFilterOptions.name != name ||
          _lastFilterOptions.type != type ||
          _lastFilterOptions.dimension != dimension) {
        _filteredLocationsPage = 1;
        _locations = [];
        _allLocationsInfo = Info(count: 0, pages: 0);
      }

      // If last page is already reached -> return
      if (_allLocationsInfo.pages != 0 && _allLocationsInfo.pages <= _filteredLocationsPage) return;

      // Reset episodes pages
      _locationsPage = 1;

      // Set filter options
      _isFilterActive = true;
      _lastFilterOptions = LocationFilterOptions(name: name, type: type, dimension: dimension);

      final currentState = state;

      var oldLocations = <Location>[];
      if (currentState.maybeWhen(locationsLoaded: (_) => true, orElse: () => false)) {
        oldLocations = currentState.maybeWhen(locationsLoaded: (locations) => locations, orElse: () => []);
      }

      emit(LocationsState.locationsLoading(oldLocations, isFirstLoad: _locationsPage == 1));

      var result = await _locationsRepository.getLocationsWithFilterAndPage(_lastFilterOptions, _filteredLocationsPage);

      _allLocationsInfo = result.info;
      _locations.addAll(result.locations);

      emit(LocationsState.locationsLoaded(_locations));

      _filteredLocationsPage++;
    } catch (e) {
      emit(LocationsState.error(LocaleKeys.error_loading_data.tr()));
    }
  }
}
