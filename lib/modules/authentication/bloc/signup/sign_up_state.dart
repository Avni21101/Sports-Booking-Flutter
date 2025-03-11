part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailValidator.pure(),
    this.isValid = false,
    this.password = const PasswordValidator.pure(),
    this.apiStatus = ApiStatus.initial,
  });

  final EmailValidator email;
  final bool isValid;
  final PasswordValidator password;
  final ApiStatus apiStatus;

  @override
  List<Object?> get props => [email, isValid, password, apiStatus];

  SignUpState copyWith({
    EmailValidator? email,
    bool? isValid,
    PasswordValidator? password,
    ApiStatus? apiStatus,
  }) {
    return SignUpState(
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }
}
