import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

abstract class AppTheme {
  static TextStyle medium = const TextStyle(
    fontSize: 22,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
  );
  static TextStyle large = const TextStyle(
      fontSize: 22, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700);
  static TextStyle small = const TextStyle(
      fontSize: 14, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400);
  static TextStyle bodySmall = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
  static TextStyle bodyMedium = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
  static TextStyle bodyLarge = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);

  static ThemeData appTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        headlineLarge: large,
        headlineMedium: medium,
        headlineSmall: small,
        bodySmall: bodySmall,
        bodyMedium: bodyMedium,
        bodyLarge: bodyLarge
    ),
    appBarTheme: AppBarTheme(
        color: AppColor.primary, centerTitle: true, titleTextStyle: medium),
  );
}
