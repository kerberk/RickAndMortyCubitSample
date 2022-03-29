import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location_detail_state.dart';
import 'package:rick_and_morty_sample/app/features/locations/repositories/locations_repository.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

class LocationDetailCubit extends Cubit<LocationDetailState> {
  final LocationsRepository _locationsRepository;

  LocationDetailCubit(this._locationsRepository) : super(const LocationDetailState.initializing());

  Future<void> getLocationById(id) async {
    try {
      if (state.maybeWhen(locationLoading: () => true, orElse: () => false)) return;

      emit(const LocationDetailState.locationLoading());

      var result = await _locationsRepository.getLocationById(id);

      emit(LocationDetailState.locationLoaded(result));
    } catch (e) {
      emit(LocationDetailState.error(LocaleKeys.error_loading_data.tr()));
    }
  }
}
