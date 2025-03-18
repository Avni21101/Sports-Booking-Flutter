import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/app_ui/utils.dart';
import 'package:sports_booking/app_ui/widgets/padding.dart';
import 'package:sports_booking/app_ui/widgets/text.dart';
import 'package:sports_booking/core/data/src/api_enum.dart';
import 'package:sports_booking/modules/authentication/bloc/login/login_cubit.dart';
import 'package:sports_booking/modules/authentication/repository/auth_repository.dart';
import 'package:sports_booking/modules/authentication/widgets/login_signup_container.dart';
import 'dart:math' as math;

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
    final size = MediaQuery.sizeOf(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state.apiStatus == ApiStatus.loaded) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          await context.router.replaceAll([HomeRoute()]);
        }
        if (state.apiStatus == ApiStatus.error) {
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Could not sign In')));
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/app_logos/app_logo.png',
                  height: 40,
                  width: 40,
                ),
                AppText.medium(
                  text: 'Sportify',
                  color: context.colorScheme.black,
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              BackgroundImage(size: size),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Insets.medium16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: Insets.xsmall8,
                    children: [
                      LoginSignUpContainer(
                        isLoading: state.apiStatus == ApiStatus.loading,
                        emailErrorText:
                            state.email.displayError != null
                                ? 'Please enter valid email.'
                                : null,
                        passwordErrorText:
                            state.password.displayError != null
                                ? 'Please enter valid password.'
                                : null,
                        isAuthLoginType: state.isAuthLoginType,
                        onEmailChange: (value) {
                          context.read<LoginCubit>().onEmailChange(value);
                        },
                        onPasswordChange: (value) {
                          context.read<LoginCubit>().onPasswordChange(value);
                        },
                        onGetStartedTap: () {
                          context.read<LoginCubit>().onSubmit();
                        },
                        onGoogleIconTap: () {
                          context.read<LoginCubit>().onGoogleSignIn();
                        },
                        onAuthTypeChange: () {
                          context.read<LoginCubit>().onAuthTypeChange();
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'By procedding you agree to our ',
                          style: TextStyle(
                            color: context.colorScheme.black,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: 'Privacy and Policy',
                              style: TextStyle(
                                color: context.colorScheme.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image.asset('assets/skt.jpeg', fit: BoxFit.fitHeight),
        Image.asset(
          'assets/sport.jpg',
          height: size.height / 2,
          fit: BoxFit.fitHeight,
        ),
        Expanded(
          child: Transform.rotate(
            angle: math.pi,
            child: ShaderMask(
              blendMode: BlendMode.srcOver,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.grey,
                    Colors.white,
                    Colors.white,
                  ],
                  // stops: [0.1, 0.5, 0.9],
                ).createShader(bounds);
              },
              child: Image.asset('assets/sport.jpg', fit: BoxFit.fitHeight),
            ),
          ),
        ),
      ],
    );
  }
}
