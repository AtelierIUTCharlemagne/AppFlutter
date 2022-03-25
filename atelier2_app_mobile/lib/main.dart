import 'package:atelier2_app_mobile/screens/connect.dart';
import 'package:atelier2_app_mobile/screens/create_event.dart';
import 'package:atelier2_app_mobile/screens/my_events.dart';
import 'package:atelier2_app_mobile/screens/one_event.dart';
import 'package:atelier2_app_mobile/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/map_component.dart';
import 'components/tab_bar.dart';
import 'data/events_collection.dart';
import 'model/event.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => EventsCollection(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReunioNous',
      initialRoute: '/connect',
      routes: {
        '/': (context) => const MyHomePage(),
        '/events': (context) => MyEvents(
              events: EventsCollection().getList(),
            ),
        '/event': (context) => OneEvent(
              event: Event("Soirée place Stan"),
            ),
        '/register': (context) => const Register(),
        '/connect': (context) => const Connect(),
        '/createEvent': (context) => const CreateEvent(),
        '/map': (context) => const MapComponent(events: []),
        '/test': (context) => const MyTabbedPage(),
      },
      theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.indigo),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to my app',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyTabbedPage(),
    );
  }
}
