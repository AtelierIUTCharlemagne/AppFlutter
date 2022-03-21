import 'package:atelier2_app_mobile/screens/CreateEvent.dart';
import 'package:atelier2_app_mobile/screens/MyEvents.dart';
import 'package:atelier2_app_mobile/screens/OneEvent.dart';
import 'package:atelier2_app_mobile/screens/Register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/TabBar.dart';
import 'data/EventsCollection.dart';

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
      title: 'TodoList',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/events': (context) => MyEvents(events: EventsCollection().getList(),),
        '/event': (context) => const OneEvent(),
        '/register': (context) => const Register(),
        '/createEvent': (context) => const CreateEvent(),
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
        title: Text("Reunionous"),
        actions: <Widget>[
              IconButton(
                icon: Icon(
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