import 'package:flutter/material.dart';
import '../tables/joke.dart';
import '../tables/profile.dart';
import '../tables/reaction.dart';
import '../widgets.dart';

class ProfileScreen extends StatefulWidget {
  final Profile user;
  final List<Joke> jokes;
  final List<Reaction> reactions;
  ProfileScreen({
    this.user,
    this.jokes,
    this.reactions,
  });
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile user;
  List<Joke> jokes;
  List<Reaction> reactions;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.user;
    jokes = widget.jokes;
    reactions = widget.reactions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 8,
          right: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Material(
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .3,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                  child: Row(
                    children: [
                      ProfilePic(
                        user: user,
                        size: 100,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          user.fullName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(offset: Offset(-1.1, -1.1)),
                                Shadow(offset: Offset(-1.1, 1.1)),
                                Shadow(offset: Offset(1.1, -1.1)),
                                Shadow(offset: Offset(1.1, 1.1)),
                              ]),
                        ),
                      )
                    ],
                  ),
                  bottom: -40,
                  left: 10,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 35,
              ),
              child: Text(
                "Recent Jokes",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: jokes.length,
                  itemBuilder: (context, index) {
                    return JokeCard(
                      joke: jokes[index],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
