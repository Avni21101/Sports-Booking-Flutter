// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:sports_booking/app_ui/theme.dart';

enum AppTextLevel { xxSmall, xSmall, small, regular, medium, large, xlarge }

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.level = AppTextLevel.regular,
    this.isUnderLine,
    this.style,
    this.textAlign,
  });

  const AppText.xxSmall({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.isUnderLine,
    this.style,
    this.textAlign,
  }) : level = AppTextLevel.xxSmall;

  const AppText.xSmall({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.isUnderLine,
    this.style,
    this.textAlign,
  }) : level = AppTextLevel.xSmall;

  const AppText.small({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.isUnderLine,
    this.style,
    this.textAlign,
  }) : level = AppTextLevel.small;

  const AppText.regular({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.isUnderLine,
    this.style,
    this.textAlign,
  }) : level = AppTextLevel.regular;

  const AppText.medium({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.isUnderLine,
    this.style,
    this.textAlign,
  }) : level = AppTextLevel.medium;

  const AppText.large({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.isUnderLine,
    this.style,
    this.textAlign,
  }) : level = AppTextLevel.large;

  const AppText.xlarge({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.maxLines,
    this.isUnderLine,
    this.style,
    this.textAlign,
  }) : level = AppTextLevel.xlarge;

  final String? text;
  final AppTextLevel level;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final bool? isUnderLine;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.maybeOf(context);
    final style = () {
      switch (level) {
        case AppTextLevel.xxSmall:
          return theme?.typography.xxSmall;
        case AppTextLevel.xSmall:
          return theme?.typography.xSmall;
        case AppTextLevel.small:
          return theme?.typography.small;
        case AppTextLevel.regular:
          return theme?.typography.regular;
        case AppTextLevel.medium:
          return theme?.typography.medium;
        case AppTextLevel.large:
          return theme?.typography.large;
        case AppTextLevel.xlarge:
          return theme?.typography.xlarge;
      }
    }();
    return Text(
      text ?? '',
      textAlign: textAlign,
      style: style?.copyWith(
        color: color ?? theme?.colors.black,
        fontSize: fontSize,
        decoration: isUnderLine ?? false ? TextDecoration.underline : null,
        decorationColor: color,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
