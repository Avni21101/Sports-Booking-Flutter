import 'package:auto_route/auto_route.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/app/route/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true, path: '/'),

    /// Authentication
    AutoRoute(page: LoginRoute.page, path: '/login'),

    /// Bottom bar Route
    AutoRoute(
      page: BottomNavigationBarRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: MyBookingsRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),

    AutoRoute(page: PlaceDetailRoute.page),
  ];
}
