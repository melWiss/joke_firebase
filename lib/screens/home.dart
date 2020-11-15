import 'package:flutter/material.dart';
import '../tables/joke.dart';
import '../tables/profile.dart';
import '../tables/reaction.dart';

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
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Latest Jokes',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: jokes.length,
                  itemBuilder: (context, index) {
                    Profile profile = users.firstWhere(
                      (element) {
                        if (element.userId == jokes[index].userId) return true;
                        return false;
                      },
                    );
                    var likeReactions = reactions.where(
                      (element) {
                        if (jokes[index].id == element.jokeId &&
                            element.reaction == ReactionType.Like) return true;
                        return false;
                      },
                    );
                    var dislikeReactions = reactions.where(
                      (element) {
                        if (jokes[index].id == element.jokeId &&
                            element.reaction == ReactionType.Dislike)
                          return true;
                        return false;
                      },
                    );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      profile.profilePicUrl,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(profile.fullName),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  jokes[index].text,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Icon(
                                        Icons.thumb_up,
                                        size: 35,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        likeReactions.length.toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Icon(
                                        Icons.thumb_down,
                                        size: 35,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dislikeReactions.length.toString(),
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.green,
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Post a Joke'),
        icon: Icon(Icons.add),
        onPressed: () {
          print("joke added");
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
