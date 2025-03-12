import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_booking/core/data/src/api_enum.dart';
import 'package:sports_booking/modules/authentication/repository/auth_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._authRepository) : super(ProfileState());

  final IAuthRepository _authRepository;

  Future<void> logout() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    try {
      final isLogout = await _authRepository.logout();
      if (isLogout) {
        emit(state.copyWith(apiStatus: ApiStatus.loaded));
      } else {
        emit(state.copyWith(apiStatus: ApiStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(apiStatus: ApiStatus.error));
    }
  }
}
