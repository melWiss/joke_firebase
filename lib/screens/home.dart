import 'package:flutter/material.dart';
import 'package:joke_firebase/screens/profile.dart';
import '../tables/joke.dart';
import '../tables/profile.dart';
import '../tables/reaction.dart';
import '../widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              index = value;
            });
          },
          children: [
            JokesList(
              jokes: jokesExample,
              title: 'Latest Jokes',
            ),
            JokesList(
              jokes: jokesExample,
              title: 'Liked Jokes',
            ),
            ProfileScreen(
              jokes: jokesExample
                  .where((element) => element.userId == userId)
                  .toList(),
              user: usersExample
                  .where((element) => element.userId == userId)
                  .first,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Post a Joke'),
        icon: Icon(Icons.add),
        onPressed: () {
          print("joke added");
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Write a joke"),
              content: TextField(),
              actions: [
                FlatButton(
                  child: Text(
                    "Send",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.thumb_up),
            icon: Icon(Icons.thumb_up_outlined),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
