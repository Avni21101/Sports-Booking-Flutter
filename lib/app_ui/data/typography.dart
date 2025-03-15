// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.xxSmall,
    required this.xSmall,
    required this.small,
    required this.regular,
    required this.medium,
    required this.large,
    required this.xlarge,
  });

  factory AppTypographyData.regular() => const AppTypographyData(
    xxSmall: TextStyle(
      fontSize: 4,
      fontWeight: FontWeight.w500,
      package: _packageName,
      fontFamily: FontFamily.opensans,
    ),
    xSmall: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w500,
      package: _packageName,
      fontFamily: FontFamily.opensans,
    ),
    small: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      package: _packageName,
      fontFamily: FontFamily.opensans,
    ),
    regular: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      package: _packageName,
      fontFamily: FontFamily.opensans,
    ),
    medium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      package: _packageName,
      fontFamily: FontFamily.opensans,
    ),
    large: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      package: _packageName,
      fontFamily: FontFamily.opensans,
    ),
    xlarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      package: _packageName,
      fontFamily: FontFamily.opensans,
    ),
  );

  static const _packageName = 'app_ui';

  final TextStyle xxSmall;
  final TextStyle xSmall;
  final TextStyle small;
  final TextStyle regular;
  final TextStyle medium;
  final TextStyle large;
  final TextStyle xlarge;

  @override
  List<Object> get props => [xSmall, small, regular, medium, large, xlarge];
}
