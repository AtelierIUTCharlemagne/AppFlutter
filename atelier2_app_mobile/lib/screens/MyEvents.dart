import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventsCollection>(builder: (context, tasks, child) {
      return Scaffold(
        //TODO test if we can remove app Bar here (necessary ?)
          appBar: AppBar(
            title: const Text('Mes tâches'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          )));
    });
  }
}
