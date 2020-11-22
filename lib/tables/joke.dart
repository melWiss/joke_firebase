import 'profile.dart';

class Joke {
  String id;
  String text;
  String userId;

  Joke({
    this.id,
    this.text,
    this.userId,
  });

  Joke.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.text = map['text'];
    this.userId = map['userId'];
  }

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'text': this.text,
        'userId': this.userId,
      };
}

List<Joke> jokesExample = List<Joke>.generate(
  12,
  (index) => Joke(
    id: jokeId,
    userId: userId,
    text:
        '"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo',
  ),
);

String jokeId = 'qskdcqsjncqs';
