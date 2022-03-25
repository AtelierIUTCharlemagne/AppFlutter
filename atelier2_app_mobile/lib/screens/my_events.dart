import 'package:atelier2_app_mobile/components/event_preview.dart';
import 'package:atelier2_app_mobile/data/current_user.dart';
import 'package:atelier2_app_mobile/data/events_collection.dart';
import 'package:atelier2_app_mobile/model/event.dart';
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
    //User user = CurrentUser.usr;

    return Consumer<eventsCollection>(builder: (context, events, child) {
      //TODO remove this.events from constructor parameters because we redifine here :

      events.getMyEvents(CurrentUser.usr);
      return Scaffold(
          appBar: AppBar(
            title: const Text('Mes évènements'),
          ),
          body: Center(
              child: ListView.builder(
            itemCount: events.Events.length,
            itemBuilder: (context, index) {
              final event = events.Events[index];
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
