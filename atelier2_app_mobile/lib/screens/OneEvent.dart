// ignore: file_names
import 'dart:convert';

import 'package:atelier2_app_mobile/components/AllComments.dart';
import 'package:atelier2_app_mobile/components/MapComponent.dart';
import 'package:atelier2_app_mobile/data/CommentCollection.dart';
import 'package:atelier2_app_mobile/model/Comment.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OneEvent extends StatefulWidget {
  OneEvent({Key? key, required this.event}) : super(key: key);

  Event event;
  getEventDatas() async {
    try {
      var response = await Dio().get(
          //'http://docketu.iutnc.univ-lorraine.fr:62349/users/signup',
          'http://localhost:62345/events/${event.id}?embed=all',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        print('decoding...');
        print(response.data);
        
        event = Event.fromJsonComment(response.data);

        print('decoded');
        print('EVENT COMMENTS');
        print(event.comments);
        // response.data.event['comments'];
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  State<OneEvent> createState() => _OneEventState();
}

class _OneEventState extends State<OneEvent> {
  @override
  Widget build(BuildContext context) {
    print(widget.event.comments);
    double width = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    widget.getEventDatas();

    List<Event> evtList = [];
    evtList.add(widget.event);
    print("evt : " + evtList.toString());
    return Scaffold(
        //TODO test if we can remove app Bar here (necessary ?)
        appBar: AppBar(
          title: const Text("Reunionous"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: MapComponent(events: evtList)),
                          const SizedBox(height: 18),
                        ])),
                ListTile(
                  title: Text(widget.event.title),
                  leading: const Icon(Icons.event_available),
                ),
                ListTile(
                  title: Text(widget.event.address),
                  leading: const Icon(Icons.location_pin),
                ),
                ListTile(
                  title: Text(widget.event.dateEvent.toString()),
                  leading: const Icon(Icons.calendar_today_rounded),
                ),
                ListTile(
                  title: Text("Organisateur : " + widget.event.createur),
                  leading: const Icon(Icons.person),
                ),
                SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      Expanded(
                          child: AllComments(comments: widget.event.comments))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
