import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/app_ui/utils.dart';

import 'app_ui/widgets/text.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Future<void> navigate() async {
    if (context.mounted) {
      await context.router.replace(HomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary200,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: Image.asset('assets/app_logos/app_logo.png', height: 90, width: 90),
            ),
          ).animate().slideX(
            delay: 700.milliseconds,
            begin: 0,
            end: -0.17,
            curve: Curves.easeOutExpo,
            duration: 400.milliseconds,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Center(
                    child: AppText.large(
                      text: 'Spotify',
                      color: context.colorScheme.primary,
                      fontSize: 40,
                    ),
                  )
                  .animate(
                    onComplete: (controller) async {
                      await navigate();
                    },
                  )
                  .fadeIn(duration: 600.milliseconds, begin: 0, delay: 700.milliseconds)
                  .slideX(
                    delay: 700.milliseconds,
                    begin: 0,
                    end: 0.080,
                    curve: Curves.easeOutExpo,
                    duration: 400.milliseconds,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
