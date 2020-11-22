import 'package:flutter/material.dart';
import 'package:social_signin_buttons/social_signin_buttons.dart';
import './home.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "😂",
                style: TextStyle(fontSize: 220),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SignInButton(
                Buttons.Google,
                onPressed: () {
                  //TODO: Change this when you finish the ui elements 1
                  print("signed in");
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home', (route) => false);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   settings: RouteSettings(name: '/home'),
                  //   builder: (context) => HomeScreen(),
                  // ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
