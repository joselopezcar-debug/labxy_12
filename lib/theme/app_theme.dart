import 'package:flutter/cupertino.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color lightBackground = Color(0xFFF5F7FA);

  static const CupertinoThemeData cupertinoTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: lightBackground,
    barBackgroundColor: primaryBlue,
    textTheme: CupertinoTextThemeData(
      primaryColor: primaryBlue,
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      textStyle: TextStyle(
        color: CupertinoColors.label,
        fontSize: 15,
      ),
    ),
  );
}