import 'package:flutter/material.dart';

class Styles {
  static Color primaryColor = Colors.teal[500];

  static Color secondaryDarkDarkColor = Color(0xFF262626);
  static Color secondaryDarkColor = Color(0xFF263030);
  static Color fontColorDark = Colors.white;

  static Color secondaryLightColor = Colors.white;
  static Color fontColorLight = Color(0xFF262626);

  static MaterialColor darkSwatch = MaterialColor(0xFF262626, {
    50: secondaryDarkDarkColor,
    100: secondaryDarkColor,
    200: fontColorDark,
    300: primaryColor,
    400: primaryColor,
    500: primaryColor,
    600: primaryColor,
    700: primaryColor,
    800: primaryColor,
    900: primaryColor,
  });

  static MaterialColor lightSwatch = MaterialColor(0xFFFFFFFF, {
    50: secondaryLightColor,
    100: secondaryLightColor,
    200: fontColorLight,
    300: primaryColor,
    400: primaryColor,
    500: primaryColor,
    600: primaryColor,
    700: primaryColor,
    800: primaryColor,
    900: primaryColor,
  });

  static MaterialColor primaryMaterialColor = MaterialColor(0xFFFFD700, {
    50: primaryColor,
    100: primaryColor,
    200: primaryColor,
    300: primaryColor,
    400: primaryColor,
    500: primaryColor,
    600: primaryColor,
    700: primaryColor,
    800: primaryColor,
    900: primaryColor,
  });
  static MaterialColor secondaryMaterialDarkDarkColor =
      MaterialColor(0xFF262626, {
    50: secondaryDarkDarkColor,
    100: secondaryDarkDarkColor,
    200: secondaryDarkDarkColor,
    300: secondaryDarkDarkColor,
    400: secondaryDarkDarkColor,
    500: secondaryDarkDarkColor,
    600: secondaryDarkDarkColor,
    700: secondaryDarkDarkColor,
    800: secondaryDarkDarkColor,
    900: secondaryDarkDarkColor,
  });
  static MaterialColor secondaryMaterialDarkColor = MaterialColor(0xFF263030, {
    50: secondaryDarkColor,
    100: secondaryDarkColor,
    200: secondaryDarkColor,
    300: secondaryDarkColor,
    400: secondaryDarkColor,
    500: secondaryDarkColor,
    600: secondaryDarkColor,
    700: secondaryDarkColor,
    800: secondaryDarkColor,
    900: secondaryDarkColor,
  });
  static MaterialColor secondaryMaterialLightColor = MaterialColor(0xFFFFFFFF, {
    50: secondaryLightColor,
    100: secondaryLightColor,
    200: secondaryLightColor,
    300: secondaryLightColor,
    400: secondaryLightColor,
    500: secondaryLightColor,
    600: secondaryLightColor,
    700: secondaryLightColor,
    800: secondaryLightColor,
    900: secondaryLightColor,
  });
  static MaterialColor fontMaterialColorDark = MaterialColor(0xFFFFFFFF, {
    50: fontColorDark,
    100: fontColorDark,
    200: fontColorDark,
    300: fontColorDark,
    400: fontColorDark,
    500: fontColorDark,
    600: fontColorDark,
    700: fontColorDark,
    800: fontColorDark,
    900: fontColorDark,
  });
  static MaterialColor fontMaterialColorLight = MaterialColor(0xFF25314D, {
    50: fontColorLight,
    100: fontColorLight,
    200: fontColorLight,
    300: fontColorLight,
    400: fontColorLight,
    500: fontColorLight,
    600: fontColorLight,
    700: fontColorLight,
    800: fontColorLight,
    900: fontColorLight,
  });

  static TextTheme textThemeDark = TextTheme(
    bodyText1: TextStyle(
      color: fontColorDark,
      fontSize: 21,
    ),
    bodyText2: TextStyle(
      color: fontColorDark,
      fontSize: 18,
    ),
    headline1: TextStyle(
      color: fontColorDark,
      fontSize: 46,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      color: fontColorDark,
      fontSize: 43,
    ),
    headline3: TextStyle(
      color: fontColorDark,
      fontSize: 40,
    ),
    headline4: TextStyle(
      color: fontColorDark,
      fontSize: 37,
    ),
    headline5: TextStyle(
      color: fontColorDark,
      fontSize: 34,
    ),
    headline6: TextStyle(
      color: fontColorDark,
      fontSize: 31,
    ),
  );
  static TextTheme textThemeLight = TextTheme(
    bodyText1: TextStyle(
      color: fontColorLight,
      fontSize: 21,
    ),
    bodyText2: TextStyle(
      color: fontColorLight,
      fontSize: 18,
    ),
    headline1: TextStyle(
      color: fontColorLight,
      fontSize: 46,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(
      color: fontColorLight,
      fontSize: 43,
    ),
    headline3: TextStyle(
      color: fontColorLight,
      fontSize: 40,
    ),
    headline4: TextStyle(
      color: fontColorLight,
      fontSize: 37,
    ),
    headline5: TextStyle(
      color: fontColorLight,
      fontSize: 34,
    ),
    headline6: TextStyle(
      color: fontColorLight,
      fontSize: 31,
    ),
  );
}
