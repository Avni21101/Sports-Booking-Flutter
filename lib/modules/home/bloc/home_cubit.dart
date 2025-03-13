import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_booking/core/data/src/api_enum.dart';
import 'package:sports_booking/modules/home/model/sport_place_model.dart';
import 'package:sports_booking/modules/home/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeState());

  final IHomeRepository _homeRepository;

  fetchPlaceListValue() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final fetchPlaceListEither = await _homeRepository.fetchSportPlaces().run();
    fetchPlaceListEither.fold(
      (l) {
        emit(state.copyWith(apiStatus: ApiStatus.error));
      },
      (result) {
        emit(state.copyWith(apiStatus: ApiStatus.loaded, sportsModelList: result));
      },
    );
  }
}
