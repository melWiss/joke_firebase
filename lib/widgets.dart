import 'package:flutter/material.dart';

import 'tables/joke.dart';
import 'tables/profile.dart';
import 'tables/reaction.dart';

class JokesList extends StatelessWidget {
  const JokesList({
    this.jokes,
    this.reactions,
    this.title,
    this.users,
  });
  final String title;
  final List<Joke> jokes;
  final List<Reaction> reactions;
  final List<Profile> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: this.jokes.length,
          itemBuilder: (context, index) {
            Profile profile = this.users.firstWhere(
              (element) {
                if (element.userId == this.jokes[index].userId) return true;
                return false;
              },
            );
            var likeReactions = this.reactions.where(
              (element) {
                if (this.jokes[index].id == element.jokeId &&
                    element.reaction == ReactionType.Like) return true;
                return false;
              },
            );
            var dislikeReactions = this.reactions.where(
              (element) {
                if (this.jokes[index].id == element.jokeId &&
                    element.reaction == ReactionType.Dislike) return true;
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
                          this.jokes[index].text,
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
    );
  }
}
