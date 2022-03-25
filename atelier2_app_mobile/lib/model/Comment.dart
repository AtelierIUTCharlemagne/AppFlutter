import 'package:faker/faker.dart';

class Comment {
  String content;
  String authorID;
  late bool completed;
  late DateTime lastConnected;

  //Constructor
  Comment(this.content, this.authorID) {
    completed = false;
    lastConnected = DateTime.now();
  }

  static sampleComments() {
    return List<Comment>.generate(
        10, (index) => Comment(faker.lorem.sentence(), faker.lorem.word()));
  }
}
