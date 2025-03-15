// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AppColorsData extends Equatable {
  const AppColorsData({
    required this.black,
    required this.white,
    required this.grey,
    required this.primary,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
  });

  factory AppColorsData.light() => const AppColorsData(
    black: Color(0xff000000),
    white: Color(0xffffffff),
    grey: Color(0xff808080),
    primary: Color(0xff4b2580),
    primary500: Color(0xFF6A4AA1),
    primary400: Color(0xFF886FC2),
    primary300: Color(0xFFA694E3),
    primary200: Color(0xFFC2B0F0),
    primary100: Color(0xFFE0D9FA),
  );

  factory AppColorsData.dark() => const AppColorsData(
    black: Color(0xff000000),
    white: Color(0xffffffff),
    grey: Color(0xff808080),
    primary: Color(0xff4b2580),
    primary500: Color(0xFF6A4AA1),
    primary400: Color(0xFF886FC2),
    primary300: Color(0xFFA694E3),
    primary200: Color(0xFFC2B0F0),
    primary100: Color(0xFFE0D9FA),
  );

  final Color black;
  final Color white;
  final Color grey;
  final Color primary;
  final Color primary500;
  final Color primary400;
  final Color primary300;
  final Color primary200;
  final Color primary100;

  @override
  List<Object> get props => [
    black,
    white,
    grey,
    primary,
    primary500,
    primary400,
    primary300,
    primary200,
    primary100,
  ];
}

abstract class AppColors {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xffBFB7B6);
  static const Color primary = Color(0xff4b2580);
  static const Color primary500 = Color(0xFF6A4AA1);
  static const Color primary400 = Color(0xFF886FC2);
  static const Color primary300 = Color(0xFFA694E3);
  static const Color primary200 = Color(0xFFC2B0F0);
  static const Color primary100 = Color(0xFFE0D9FA);
}
