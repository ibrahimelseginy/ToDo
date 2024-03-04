import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff5d9cec);
  static Color backgroundColorLight = const Color(0xffDFECDB);
  static Color backgroundColorDark = const Color(0xff060e1e);
  static Color greenColor = const Color(0xff61E757);
  static Color redColor = const Color(0xffEC4B4B);
  static Color balckColor = const Color(0xff141922);
  static Color greyColor = const Color(0xffC8C9CB);
  static Color whiteColor = const Color(0xffffffff);

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      scaffoldBackgroundColor: backgroundColorLight);
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          surfaceTintColor: backgroundColorDark));
}
