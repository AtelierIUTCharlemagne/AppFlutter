// ignore_for_file: file_names

import 'package:atelier2_app_mobile/components/EventPreview.dart';
import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({Key? key, required this.events}) : super(key: key);

  final List<Event> events;

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventsCollection>(builder: (context, events, child) {
      events.getMyEvents();
      return Scaffold(
          appBar: AppBar(
            title: const Text('Mes évènements'),
          ),
          body: Center(
              child: ListView.builder(
            itemCount: events.Events.length,
            itemBuilder: (context, index)  {
              final event = events.Events[index];
              //return EventPreview(event: event.awaitEventDatas());
              return EventPreview(event: event);
            },
          )),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createEvent');
              },
              child: const Icon(Icons.add)));
    });
  }
}
