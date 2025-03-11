import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:sports_booking/core/data/src/api_enum.dart';
import 'package:sports_booking/core/domain/validators/email_validator.dart';
import 'package:sports_booking/core/domain/validators/password_validator.dart';
import 'package:sports_booking/modules/authentication/model/auth_request_model.dart';
import 'package:sports_booking/modules/authentication/repository/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final IAuthRepository _authenticationRepository;

  void onEmailChange(String value) {
    final email = EmailValidator.dirty(value.trim());
    emit(state.copyWith(email: email, isValid: Formz.validate([email])));
  }

  void onPasswordChange(String value) {
    final password = PasswordValidator.dirty(value.trim());
    emit(state.copyWith(password: password, isValid: Formz.validate([password])));
  }

  Future<void> onSubmit() async {
    final email = EmailValidator.dirty(state.email.value);
    final password = PasswordValidator.dirty(state.password.value);
    emit(
      state.copyWith(email: email, password: password, isValid: Formz.validate([email, password])),
    );

    if (state.isValid) {
      emit(state.copyWith(apiStatus: ApiStatus.loading));
      final signupEither =
          await _authenticationRepository
              .signup(AuthRequestModel(email: state.email.value, password: state.password.value))
              .run();
      signupEither.fold(
        (l) => emit(state.copyWith(apiStatus: ApiStatus.error)),
        (r) => emit(state.copyWith(apiStatus: ApiStatus.loaded)),
      );
    }
  }
}
