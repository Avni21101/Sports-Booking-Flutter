import 'package:auto_route/auto_route.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/modules/authentication/repository/auth_repository.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final userId = AuthRepository.supabaseClient.auth.currentUser?.id;
    if (userId != null) {
      resolver.next(true);
    } else {
      resolver.redirectUntil(LoginRoute());
    }
  }
}
