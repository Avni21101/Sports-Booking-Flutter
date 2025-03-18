part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const EmailValidator.pure(),
    this.isValid = false,
    this.password = const PasswordValidator.pure(),
    this.apiStatus = ApiStatus.initial,
    this.isAuthLoginType = true,
  });

  final EmailValidator email;
  final bool isValid;
  final PasswordValidator password;
  final ApiStatus apiStatus;
  final bool isAuthLoginType;

  @override
  List<Object?> get props => [
    email,
    isValid,
    password,
    apiStatus,
    isAuthLoginType,
  ];

  LoginState copyWith({
    EmailValidator? email,
    bool? isValid,
    PasswordValidator? password,
    ApiStatus? apiStatus,
    bool? isAuthLoginType,
  }) {
    return LoginState(
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
      apiStatus: apiStatus ?? this.apiStatus,
      isAuthLoginType: isAuthLoginType ?? this.isAuthLoginType,
    );
  }
}
