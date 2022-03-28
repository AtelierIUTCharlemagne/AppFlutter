// ignore_for_file: file_names

import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_field/date_field.dart';

import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';
import 'package:validators/validators.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({Key? key}) : super(key: key);

  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool isTitleValid(String password) => password.length >= 3;
  //bool isDateValid(DateTime date) => Limite ?
  String mapBoxApiKey =
      'pk.eyJ1IjoicGhvcmN5cy1qdWxlcyIsImEiOiJja3k4bnU5cjUwMWk5MnZsYmp1am5pem04In0.LTlGjtYT-0MdURTgGk9fDA';


  @override
  Widget build(BuildContext context) {
    Event evt = Event();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Reunionous"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/Register');
              },
            )
          ],
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: FocusTraversalGroup(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: widget.formKey,
                onChanged: () {
                  try {
                    Form.of(primaryFocus!.context!)!.save();
                    Form.of(primaryFocus!.context!)!.validate();
                  } catch (e) {}

                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Nom
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person_outlined),
                          hintText: 'What you\'re planning to do ?',
                          labelText: 'Title *',
                        ),
                        /*
                        validator: (String? value) {
                          return (!isTitleValid(value!))
                              ? 'This is not a valid title'
                              : null;
                        },
                        */
                        onSaved: (String? value) {
                          //String tmp = value!;
                          //String tmp2 = tmp;
                          //evt.setTitle(value);
                          evt.title = value!;
                          //print("title " + value!);
                          //evt.title = value;
                          print(" evt.title " + evt.title);
                        },
                        //onSaved: (String? value) => evt.title = value!,
                      ),
                      DateTimeFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.event),
                          labelText: 'Date *',
                        ),
                        mode: DateTimeFieldPickerMode.dateAndTime,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'This is not a valid date for an event'
                            : null,
                        onSaved: (DateTime? value) {
                          //print("date : "+value.toString());
                          evt.dateEvent = value!;
                        },
                      ),

                      //Adress
                      Expanded(
                          child: MapBoxPlaceSearchWidget(
                        popOnSelect: false,
                        //popOnSelect: false,
                        apiKey: mapBoxApiKey,
                        //limit: 10,
                        searchHint: 'Where is the event ?',
                        onSelected: (place) {
                          print("ici : " + place.toString());
                          print("center :: " + place.center.toString());
                          evt.address = place.toString();
                          evt.location = place.center[0].toString() +
                              ", " +
                              place.center[1].toString();
                        },
                        context: context,
                      )),
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      ElevatedButton(
                          onPressed: () {
                            if (widget.formKey.currentState!.validate()) {
                              // TODO message confirmation ?
                              print("evt : "+ evt.toString());
                              evt.createEvent();
                              //Navigator.pushNamed(context, '/');
                            }
                          },
                          child: const Text("Create"))
                    ]),
              ),
            )));
  }
}
