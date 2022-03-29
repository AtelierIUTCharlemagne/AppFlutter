// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:faker/faker.dart';

import 'package:http/http.dart' as http;

import 'CurrentUser.dart';

//Liste des tâches pour le moment gènèré avec faker

class EventsCollection extends ChangeNotifier {
  late List<Event> Events;
  bool refreshed = false;
  EventsCollection() {
    Events = [];
    //Events = getMyEvents();
    //generateSampleEvents();
  }
  void createEvent() {
    notifyListeners();
  }

  void removeEvent(Event Event, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Voulez-vous vraiment supprimer cette évênement ?'),
      action: SnackBarAction(
          label: 'Oui',
          onPressed: () {
            Events.remove(Event);
            notifyListeners();
          }),
    ));
    print("evt collectioon : removeEvent");
  }

  ///Turn a JSON collection of events to an Events List
  ///@return EventsCollection
  factory EventsCollection.fromJson(Map<String, dynamic> json) {
    EventsCollection e = EventsCollection();
    json['events'].forEach((item) {
      e.Events.add(Event.fromJson(item));
    });
    return e;
  }

  /*
  void setEventCompleted(Event Event) {
    //Event.complete();
    notifyListeners();
  }
*/
  void generateSampleEvents() {
    print('coucou');
    Events = List<Event>.generate(3, (index) => Event());
    //faker.lorem.sentence()
  }

  getMyEvents() async {
    final response = await http.get(Uri.parse(
        //'http://docketu.iutnc.univ-lorraine.fr:62345/events?user_id=${CurrentUser.usr.id}'));
        'http://localhost:62345/events?user_id=${CurrentUser.usr.id}'));

    if (response.statusCode == 200) {
      Events = EventsCollection.fromJson(jsonDecode(response.body)).Events;
      notifyListeners(); //Notify keep refreshing learn to debug this
      return Event;
    } else {
      throw Exception('Failed to load events');
    }
  }

  List<Event> getList() {
    return Events;
  }
}
