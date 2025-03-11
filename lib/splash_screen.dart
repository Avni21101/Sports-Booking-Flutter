import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/modules/authentication/screens/sign_up_screen.dart';
import 'app_ui/widgets/text.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    await Future<void>.delayed(Duration(seconds: 2));
    if (!mounted) return;
    await context.replaceRoute(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AppText.brand(text: 'Sports Booking')));
  }
}
