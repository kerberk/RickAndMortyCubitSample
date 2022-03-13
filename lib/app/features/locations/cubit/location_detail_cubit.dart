import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/repository/locations_repository.dart';
import 'package:rick_and_morty_sample/generated/locale_keys.g.dart';

part 'location_detail_state.dart';

class LocationDetailCubit extends Cubit<LocationDetailState> {
  final LocationsRepository _locationsRepository;

  LocationDetailCubit(this._locationsRepository) : super(const LocationDetailInitial());

  Future<void> getLocationById(id) async {
    try {
      if (state is LocationDetailLoading) return;

      emit(const LocationDetailLoading());

      var result = await _locationsRepository.getLocationById(id);

      emit(LocationDetailLoaded(result));
    } catch (e) {
      emit(LocationDetailError(LocaleKeys.error_loading_data.tr()));
    }
  }
}
