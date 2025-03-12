import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_booking/app/route/app_router.dart';
import 'package:sports_booking/app_ui/responsive_theme.dart';
import 'package:sports_booking/bootstrap.dart';
import 'core/domain/bloc/theme_bloc.dart';

Future<void> main() async {
  await bootStrap();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, AppThemeColorMode>(
        builder: (context, colorMode) {
          return AppResponsiveTheme(
            colorMode: colorMode,
            child: MaterialApp.router(
              routerConfig: _appRouter.config(),
              title: 'Sports Booking',
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
