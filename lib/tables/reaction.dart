import 'profile.dart';
import 'joke.dart';

enum ReactionType { Like, Dislike }

ReactionType fromStringToReaction(String reaction) {
  switch (reaction) {
    case 'ReactionType.Like':
      return ReactionType.Like;
      break;
    case 'ReactionType.Dislike':
      return ReactionType.Dislike;
      break;
    default:
      return ReactionType.Like;
  }
}

String fromReactionToString(ReactionType reaction) {
  switch (reaction) {
    case ReactionType.Like:
      return 'ReactionType.Like';
      break;
    case ReactionType.Dislike:
      return 'ReactionType.Dislike';
      break;
    default:
      return 'ReactionType.Like';
  }
}

class Reaction {
  String id;
  String userId;
  String jokeId;
  ReactionType reaction;

  Reaction({
    this.id,
    this.reaction,
    this.userId,
    this.jokeId,
  });

  Reaction.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.userId = map['userId'];
    this.jokeId = map['jokeId'];
    this.reaction = fromStringToReaction(map['reaction']);
  }

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'userId': this.userId,
        'jokeId': this.jokeId,
        'reaction': fromReactionToString(this.reaction),
      };
}

String reactionId = 'reactionId#';

List<Reaction> reactionsExample = List<Reaction>.generate(
  24,
  (index) => Reaction(
      id: '$reactionId$index',
      reaction: ReactionType.values[index % 2],
      userId: userId,
      jokeId: jokesExample[0].id),
);
