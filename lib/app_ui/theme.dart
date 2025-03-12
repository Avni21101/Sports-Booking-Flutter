import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'data/data.dart';

export 'data/colors.dart';
export 'data/data.dart';
export 'data/font_weight.dart';
export 'data/typography.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({required this.data, required super.child, super.key});

  final AppThemeData data;

  static AppThemeData? maybeOf(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget?.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
