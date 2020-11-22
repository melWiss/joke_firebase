import 'package:flutter/material.dart';

import 'tables/joke.dart';
import 'tables/profile.dart';
import 'tables/reaction.dart';

class JokesList extends StatelessWidget {
  const JokesList({
    this.jokes,
    this.title,
  });
  final String title;
  final List<Joke> jokes;

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
            Profile profile = usersExample.firstWhere(
              (element) {
                if (element.userId == this.jokes[index].userId) return true;
                return false;
              },
            );
            var likeReactions = reactionsExample.where(
              (element) {
                if (this.jokes[index].id == element.jokeId &&
                    element.reaction == ReactionType.Like) return true;
                return false;
              },
            );
            var dislikeReactions = reactionsExample.where(
              (element) {
                if (this.jokes[index].id == element.jokeId &&
                    element.reaction == ReactionType.Dislike) return true;
                return false;
              },
            );
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: JokeCard(joke: jokes[index]),
            );
          },
        )),
      ],
    );
  }
}

class JokeCard extends StatelessWidget {
  const JokeCard({
    @required this.joke,
    this.extended = false,
  });

  final Joke joke;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    List<Reaction> reactions =
        reactionsExample.where((element) => element.jokeId == joke.id).toList();
    List<Reaction> likeReactions = reactions
        .where((element) => element.reaction == ReactionType.Like)
        .toList();
    List<Reaction> dislikeReactions = reactions
        .where((element) => element.reaction == ReactionType.Dislike)
        .toList();
    Profile profile =
        usersExample.where((element) => element.userId == joke.userId).first;
    return InkWell(
      onTap: extended
          ? () {}
          : () {
              Navigator.of(context).pushNamed('/home?jokeid=${joke.id}');
            },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: [
              Row(
                children: [
                  ProfilePic(
                    user: profile,
                    size: 50,
                    padding: 0,
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
                  this.joke.text,
                  maxLines: !extended ? 3 : 999,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          size: 35,
                        ),
                        onPressed: () {
                          //TODO: Add like action
                        },
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
                      child: IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          size: 35,
                          color: Colors.red[300],
                        ),
                        onPressed: () {
                          //TODO: add dislike action
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        dislikeReactions.length.toString(),
                        style: TextStyle(
                          color: Colors.red[300],
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
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
    @required this.user,
    this.size = 150,
    this.padding = 10,
  }) : super(key: key);

  final Profile user;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.white,
        height: size + padding,
        width: size + padding,
        child: Center(
          child: ClipOval(
            child: Image.network(
              user.profilePicUrl,
              height: size,
              width: size,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
