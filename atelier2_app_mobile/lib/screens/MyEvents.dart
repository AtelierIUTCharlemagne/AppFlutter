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
    return Consumer<EventsCollection>(builder: (context, events, child){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mes tâches'),
        ),
        body: Center(
          child: ListView.builder(itemCount : widget.events.length,
                itemBuilder : (context, index) {
                  final event = widget.events[index];
                  return EventPreview(event: event); 
                },
              )
            )
        );});
    }
  }
