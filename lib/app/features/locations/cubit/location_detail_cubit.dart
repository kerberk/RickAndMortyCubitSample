import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_sample/app/features/locations/models/location.dart';
import 'package:rick_and_morty_sample/app/features/locations/repository/locations_repository.dart';

part 'location_detail_state.dart';

class LocationDetailCubit extends Cubit<LocationDetailState> {
  final LocationsRepository _locationsRepository;

  final int _id;

  LocationDetailCubit(this._locationsRepository, this._id) : super(const LocationDetailInitial());

  Future<void> getLocationById() async {
    try {
      if (state is LocationDetailLoading) return;

      emit(const LocationDetailLoading());

      var result = await _locationsRepository.getLocationById(_id);

      emit(LocationDetailLoaded(result));
    } catch (e) {
      emit(const LocationDetailError('Couldn\'t load data'));
    }
  }
}