// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:atelier2_app_mobile/model/Comment.dart';
// ignore: import_of_legacy_library_into_null_safe

//Liste des tâches pour le moment gènèré avec faker

class CommentCollection extends ChangeNotifier {
  late List<Comment> Comments;
  bool refreshed = false;
  CommentCollection() {
    //Utilisation commentaire d'exemple : 
    Comments = Comment.sampleComments();
    //Comments = getMyComments();
  }


  ///Turn a JSON collection of Comments to an Comments List
  ///@return CommentCollection
  factory CommentCollection.fromJson(List<dynamic> json) {
    print("we tring to create a comment collection from json");
    CommentCollection e = CommentCollection();
    json.forEach((item) {
      e.Comments.add(Comment.fromJson(item));
    });
    return e;
  }

  @override
  String toString() {
    return super.toString() + " with : " + Comments.length.toString()+ "items";
  }



}
