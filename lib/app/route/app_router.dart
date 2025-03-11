import 'package:auto_route/auto_route.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/app/route/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),

    /// Authentication
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page),

    /// Home Bottom bar
    AutoRoute(page: HomeRoute.page, guards: [AuthGuard()]),
  ];
}
