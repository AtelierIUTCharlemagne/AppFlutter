// ignore: file_names
import 'package:atelier2_app_mobile/components/AllComments.dart';
import 'package:atelier2_app_mobile/components/usefulWidget.dart';
import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OneEvent extends StatefulWidget {
  OneEvent({Key? key, required this.event}) : super(key: key);

  final Event event;
  @override
  State<OneEvent> createState() => _OneEventState();
}

class _OneEventState extends State<OneEvent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

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
          body: SafeArea(
              child: SingleChildScrollView(
                  //onTap: () => FocusScope.of(context).unfocus(),

                  child: Expanded(
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
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
                      const SizedBox(height: 18)
                    ],
                  ),
                ),
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
            Expanded(child: AllComments(eventId: widget.event.id))
          ])))));
    });
  }
}
