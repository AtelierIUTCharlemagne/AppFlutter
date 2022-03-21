// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:faker/faker.dart';

//Liste des tâches pour le moment gènèré avec faker

class EventsCollection extends ChangeNotifier {
  late List<Event> Events;
  EventsCollection() {
    Events = [];
    generateSampleEvents();
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

  /*
  void setEventCompleted(Event Event) {
    //Event.complete();
    notifyListeners();
  }
*/
  void generateSampleEvents() {
    print('coucou');
    Events = List<Event>.generate(3, (index) => Event(faker.lorem.sentence()));
  }

  List<Event> getList() {
    return Events;
  }
}
