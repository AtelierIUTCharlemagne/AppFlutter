import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventPreview extends StatefulWidget {
  const EventPreview({Key? key, required this.event}) : super(key: key);

  final Event event;
  @override
  State<EventPreview> createState() => _EventPreviewState();
}

class _EventPreviewState extends State<EventPreview> {
  @override
  Widget build(BuildContext context) {
/*
    Widget eventInfo() {
      return Consumer<EventsCollection>(builder: (context, events, child) {
        return Column(children: [
          ListTile(
            title: Text(widget.event.title),
            subtitle: Text("Par : " +
                widget.event.authorId.toString() +
                "\n" +
                "à " +
                widget.event.address),
            onTap: () {
              Navigator.pushNamed(context, '/event');
            },
            
          ),
        ]);
      });
    }
    */
    return Consumer<EventsCollection>(builder: (context, events, child) {
      return  Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ListTile(
                    title: Text(widget.event.title),
                    subtitle: Text("Par : " +
                        widget.event.authorId.toString() +
                        "\n" +
                        "à " +
                        widget.event.address),
                    onTap: () {
                      Navigator.pushNamed(context, '/event');
                    },
                  ),
              ],
              ),
          );
    });
  }
}
