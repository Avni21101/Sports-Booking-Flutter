// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AppColorsData extends Equatable {
  const AppColorsData({required this.black, required this.white, required this.grey});

  factory AppColorsData.light() => const AppColorsData(
    black: Color(0xff000000),
    white: Color(0xffffffff),
    grey: Color(0xff808080),
  );

  factory AppColorsData.dark() => const AppColorsData(
    black: Color(0xff000000),
    white: Color(0xffffffff),
    grey: Color(0xff808080),
  );

  final Color black;
  final Color white;
  final Color grey;

  @override
  List<Object> get props {
    return [black, white, grey];
  }
}

abstract class AppColors {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xffBFB7B6); //FAB border color in onboarding
}
