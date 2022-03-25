import 'package:atelier2_app_mobile/components/all_comments.dart';
import 'package:atelier2_app_mobile/components/map_component.dart';
import 'package:atelier2_app_mobile/model/event.dart';
import 'package:flutter/material.dart';

class OneEvent extends StatefulWidget {
  const OneEvent({Key? key, required this.event}) : super(key: key);

  final Event event;
  @override
  State<OneEvent> createState() => _OneEventState();
}

class _OneEventState extends State<OneEvent> {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double bottomPadding = MediaQuery.of(context).padding.bottom;

    List<Event> evtList = [];
    evtList.add(widget.event);
    //return Consumer<EventsCollection>(builder: (context, events, child) {
    //TODO this keep refresh if it's a consumer.
    //Make a refresh function ?
    //print("je me refresh");
    //print("evt : " + evtList.toString());
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
                Navigator.pushNamed(context, '/register');
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
                  title: Text(
                      "Organisateur : " + widget.event.getOrganisateurName()),
                  leading: const Icon(Icons.person),
                ),
                SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      Expanded(child: AllComments(eventId: widget.event.id))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
    //});
  }
}

/*
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/SampleMap.png',
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.event.title),
                ),
                Text(widget.event.address),
                const SizedBox(
                  height: 60,
                  width: 100,
                  child: Text("2 Routes de Paris"),
                ),
                SizedBox(
                  height: 60,
                  width: 100,
                  child: Text(widget.event.address),
                ),
              ],
            ),
            //Expanded(child: AllComments(eventId: widget.event.id))
          )));
    });
  }
}
*/
