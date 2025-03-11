import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/app_ui/widgets/padding.dart';
import 'package:sports_booking/app_ui/widgets/text.dart';
import 'package:sports_booking/core/data/src/api_enum.dart';
import 'package:sports_booking/core/presentation/widgets/app_button.dart';
import 'package:sports_booking/core/presentation/widgets/app_textfield.dart';
import 'package:sports_booking/modules/authentication/bloc/login/login_cubit.dart';
import 'package:sports_booking/modules/authentication/repository/auth_repository.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => LoginCubit(context.read<AuthRepository>()),
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.loaded) {
          context.router.replaceAll([HomeRoute()]);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: AppText.L(text: 'Sign up')),
          body: Padding(
            padding: const EdgeInsets.all(Insets.medium16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: Insets.xsmall8,
                children: [
                  AppTextField(
                    errorText: state.email.displayError != null ? 'Write valid email' : null,
                    hintText: 'Enter Email',
                    isPasswordField: false,
                    onChange: (email) {
                      context.read<LoginCubit>().onEmailChange(email);
                    },
                  ),
                  AppTextField(
                    errorText: state.password.displayError != null ? 'Write valid pass' : null,
                    hintText: 'Enter password',
                    isPasswordField: true,
                    onChange: (password) {
                      context.read<LoginCubit>().onPasswordChange(password);
                    },
                  ),
                  AppButton(
                    buttonWidget:
                        state.apiStatus == ApiStatus.loading
                            ? CircularProgressIndicator()
                            : AppText(text: 'Login'),
                    onTap: () async {
                      await context.read<LoginCubit>().onSubmit();
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      await context.replaceRoute(SignUpRoute());
                    },
                    child: AppText.L(text: "Don't have an account?"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
