import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  ErrorScreen({this.error});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Not Found",
              style: Theme.of(context).textTheme.headline1,
            ),
            error != null ? Text(error) : Container(),
            FlatButton(
              child: Text("Go Home"),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home',
                  (_) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
