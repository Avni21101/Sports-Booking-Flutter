part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.apiStatus = ApiStatus.initial, this.sportsModelList = const []});

  final ApiStatus apiStatus;
  final List<SportPlaceModel> sportsModelList;

  @override
  List<Object?> get props => [apiStatus, sportsModelList];

  HomeState copyWith({ApiStatus? apiStatus, List<SportPlaceModel>? sportsModelList}) {
    return HomeState(
      apiStatus: apiStatus ?? this.apiStatus,
      sportsModelList: sportsModelList ?? this.sportsModelList,
    );
  }
}
