import 'package:atelier2_app_mobile/components/one_comment.dart';
import 'package:atelier2_app_mobile/model/comment.dart';
import 'package:flutter/material.dart';

class AllComments extends StatefulWidget {
  const AllComments({Key? key, required this.eventId}) : super(key: key);

  final int eventId;
  @override
  State<AllComments> createState() => _AllCommentsState();
}

class _AllCommentsState extends State<AllComments> {
  @override
  Widget build(BuildContext context) {
    //Consumer de comment
    List<Comment> commentsList = Comment.sampleComments();
    //return Row(children: <Widget>[
    //Expanded(
    //child:
    return ListView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: commentsList.length,
        itemBuilder: (context, index) {
          final comment = commentsList[index];
          return OneComment(comment: comment);
        });
  }
}
