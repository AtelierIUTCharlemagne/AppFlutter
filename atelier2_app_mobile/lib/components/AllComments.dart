// ignore_for_file: file_names

import 'package:atelier2_app_mobile/components/OneComment.dart';
import 'package:atelier2_app_mobile/model/Comment.dart';
import 'package:flutter/material.dart';

class AllComments extends StatefulWidget {
  const AllComments({Key? key, required this.comments}) : super(key: key);

  final List comments;
  @override
  State<AllComments> createState() => _AllCommentsState();
}

class _AllCommentsState extends State<AllComments> {
  @override
  Widget build(BuildContext context) {
    print("ALL COMMENTS");
    print(widget.comments);
    //Consumer de comment TODO
    //return Row(children: <Widget>[
    //Expanded(
    //child:
    return ListView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.comments.length,
        itemBuilder: (context, index) {
          final comment = widget.comments[index];
          return OneComment(comment: comment);
        });
  }
}
