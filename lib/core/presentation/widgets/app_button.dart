import 'package:flutter/material.dart';
import 'package:sports_booking/app_ui/utils.dart';
import 'package:sports_booking/app_ui/widgets/border_radius.dart';
import 'package:sports_booking/app_ui/widgets/padding.dart';
import 'package:sports_booking/app_ui/widgets/text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.isLoading,
  });

  // final String label;
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 47,
        width: double.infinity,
        padding: EdgeInsets.all(Insets.xsmall8),
        decoration: BoxDecoration(
          color: context.colorScheme.grey,
          borderRadius: BorderRadius.circular(AppBorderRadius.small8),
        ),
        child:
            isLoading
                ? Center(
                  child: CircularProgressIndicator(
                    color: context.colorScheme.white,
                  ),
                )
                : Center(
                  child: AppText.regular(
                    text: label,
                    color: context.colorScheme.white,
                  ),
                ),
      ),
    );
  }
}
