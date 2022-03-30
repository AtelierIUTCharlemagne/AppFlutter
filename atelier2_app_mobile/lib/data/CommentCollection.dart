// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:atelier2_app_mobile/model/Comment.dart';
// ignore: import_of_legacy_library_into_null_safe

//Liste des tâches pour le moment gènèré avec faker

class CommentCollection extends ChangeNotifier {
  late List<Comment> Comments;
  bool refreshed = false;
  CommentCollection() {
    Comments = [];
    //Comments = getMyComments();
    //generateSampleComments();
  }


  ///Turn a JSON collection of Comments to an Comments List
  ///@return CommentCollection
  factory CommentCollection.fromJson(Map<String, dynamic> json) {
    CommentCollection e = CommentCollection();
    json['Comments'].forEach((item) {
      e.Comments.add(Comment.fromJson(item));
    });
    return e;
  }



}
