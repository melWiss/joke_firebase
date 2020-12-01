import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joke_firebase/screens/error.dart';
import 'package:joke_firebase/screens/home.dart';
import 'package:joke_firebase/screens/joke.dart';
import 'package:joke_firebase/tables/joke.dart';
import './screens/auth.dart';
import 'style.dart';
import 'widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureWidget<FirebaseApp>(
      future: _initialization,
      child: (snap) => MaterialApp(
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
        // home: AuthScreen(),
        initialRoute: '/auth',
        onGenerateInitialRoutes: (initialRoute) {
          print(initialRoute);
          return [
            MaterialPageRoute(
              builder: (context) => AuthScreen(),
              settings: RouteSettings(name: initialRoute),
            )
          ];
        },
        onGenerateRoute: (settings) {
          Uri path = Uri.parse(settings.name);
          try {
            switch (path.pathSegments[0]) {
              case 'auth':
                return MaterialPageRoute(
                  builder: (context) => AuthScreen(),
                  settings: RouteSettings(name: settings.name),
                );
                break;
              case 'home':
                if (path.queryParameters.keys.length == 0)
                  return MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                    settings: RouteSettings(name: settings.name),
                  );
                else {
                  Joke joke = jokesExample
                      .where((element) =>
                          element.id == path.queryParameters['jokeid'])
                      .first;
                  return MaterialPageRoute(
                    builder: (context) => JokeScreen(
                      joke: joke,
                    ),
                    settings: RouteSettings(name: settings.name),
                  );
                }
                break;
              default:
                return MaterialPageRoute(
                  builder: (context) => ErrorScreen(),
                  settings: RouteSettings(name: settings.name),
                );
            }
          } catch (e) {
            print(e.toString());
            return MaterialPageRoute(
              builder: (context) => ErrorScreen(
                error: e.toString(),
              ),
              settings: RouteSettings(name: settings.name),
            );
          }
        },
      ),
    );
  }
}
