import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

abstract class AppTheme{
  static TextStyle medium = TextStyle(
    fontSize: 22,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
  );
  static TextStyle large = const TextStyle(fontSize: 22, fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700);
  static TextStyle small = const TextStyle(fontSize: 14, fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400);

  static ThemeData appTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headlineLarge: large,
      headlineMedium: medium,
      headlineSmall: small
    ),
    appBarTheme: AppBarTheme(
      color: AppColor.primary,
      centerTitle: true,
      titleTextStyle: medium
    ),

  );
}