import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';

@RoutePage()
class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), MyBookingsRoute(), ProfileRoute()],
      transitionBuilder:
          (context, child, animation) => FadeTransition(opacity: animation, child: child),
      builder: (context, child) {
        /// obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);

        /// Here we're building our Scaffold inside of AutoTabsRouter
        /// to access the tabsRouter controller provided in this context
        return Scaffold(
          body: child,
          bottomNavigationBar:
              context.topRouteMatch.meta['hideNavBar'] == true
                  ? null
                  : BottomNavigationBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    items: [
                      BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.list_alt),
                        label: 'My Bookings',
                      ),
                      BottomNavigationBarItem(icon: const Icon(Icons.person), label: 'Profile'),
                    ],
                  ),
        );
      },
    );
  }
}
