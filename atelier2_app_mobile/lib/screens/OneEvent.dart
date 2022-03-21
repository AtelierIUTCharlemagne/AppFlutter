// ignore: file_names
import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OneEvent extends StatefulWidget {
  const OneEvent({Key? key}) : super(key: key);

  @override
  State<OneEvent> createState() => _OneEventState();
}

class _OneEventState extends State<OneEvent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventsCollection>(builder: (context, tasks, child) {
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
          body: Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Title(
              title: 'Soiré de fou',
              color: Colors.indigo,
              child: const Text("Chez Michel", textDirection: TextDirection.ltr),
            ),
          ));
    });
  }
}
