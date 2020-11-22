import 'package:flutter/material.dart';
import 'package:joke_firebase/widgets.dart';
import '../tables/joke.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({this.joke});
  final Joke joke;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(joke.text),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: JokeCard(
              joke: joke,
              extended: true,
            ),
          ),
        ),
      ),
    );
  }
}
