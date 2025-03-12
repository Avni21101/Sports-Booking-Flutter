import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_booking/app_ui/widgets/text.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: AppText.XL('Profile Screen'));
  }
}
