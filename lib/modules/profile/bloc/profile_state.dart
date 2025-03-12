part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({this.apiStatus = ApiStatus.initial});

  final ApiStatus apiStatus;

  @override
  List<Object?> get props => [apiStatus];

  ProfileState copyWith({ApiStatus? apiStatus}) {
    return ProfileState(apiStatus: apiStatus ?? this.apiStatus);
  }
}
