import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_booking/app_ui/widgets/text.dart';

@RoutePage()
class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: AppText.large(text: 'My Bookings'));
  }
}
