import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/app_ui/widgets/text.dart';
import 'package:sports_booking/core/data/src/api_enum.dart';
import 'package:sports_booking/core/presentation/widgets/app_button.dart';
import 'package:sports_booking/modules/authentication/repository/auth_repository.dart';
import 'package:sports_booking/modules/profile/bloc/profile_cubit.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) async {
        if (state.apiStatus == ApiStatus.loaded) {
          await context.router.replaceAll([LoginRoute()]);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.regular(text: 'Profile Screen'),
                AppButton(
                  buttonWidget:
                      state.apiStatus == ApiStatus.loading
                          ? CircularProgressIndicator()
                          : AppText(text: 'Logout'),
                  onTap: () async {
                    await context.read<ProfileCubit>().logout();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => ProfileCubit(context.read<AuthRepository>()),
        child: this,
      ),
    );
  }
}
