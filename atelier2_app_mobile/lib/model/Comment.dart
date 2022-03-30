// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';

class Comment {
  String text;
  String authorID;
  late DateTime lastConnected;

  //Constructor
  Comment(this.text, this.authorID) {
    lastConnected = DateTime.now();
  }
  factory Comment.fromJson(Map<String, dynamic> json) {
    Comment c = Comment(json['text'], json['author_id']);
    return c;
  }

  static sampleComments() {
    return List<Comment>.generate(
        10, (index) => Comment(faker.lorem.sentence(), faker.lorem.word()));
  }
}
