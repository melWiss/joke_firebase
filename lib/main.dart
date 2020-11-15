import 'package:flutter/material.dart';
import './screens/auth.dart';
import 'style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes',
      darkTheme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Styles.fontColorDark,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Styles.secondaryMaterialDarkColor,
          elevation: 0,
          textTheme: Styles.textThemeDark,
        ),
        iconTheme: IconThemeData(
          color: Styles.primaryMaterialColor,
        ),
        scaffoldBackgroundColor: Theme.of(context).canvasColor,
        cursorColor: Styles.fontColorDark,
        brightness: Brightness.dark,
        primarySwatch: Styles.darkSwatch,
        primaryColor: Styles.primaryColor,
        accentColor: Styles.secondaryDarkColor,
        canvasColor: Styles.secondaryMaterialDarkDarkColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Styles.textThemeDark,
      ),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Styles.secondaryMaterialLightColor,
          elevation: 0,
          textTheme: Styles.textThemeLight,
        ),
        iconTheme: IconThemeData(
          color: Styles.primaryColor,
        ),
        scaffoldBackgroundColor: Theme.of(context).canvasColor,
        cursorColor: Styles.fontColorLight,
        brightness: Brightness.light,
        primaryColor: Styles.primaryColor,
        primarySwatch: Styles.lightSwatch,
        canvasColor: Styles.secondaryLightColor,
        accentColor: Styles.secondaryLightColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Styles.textThemeLight,
      ),
      home: AuthScreen(),
    );
  }
}
