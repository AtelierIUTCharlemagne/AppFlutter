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

  late GlobalKey<FormState> formKey;
  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool isTitleValid(String password) => password.length >= 6;
  //bool isDateValid(DateTime date) => Limite ?
  String mapBoxApiKey =
      'pk.eyJ1IjoicGhvcmN5cy1qdWxlcyIsImEiOiJja3k4bnU5cjUwMWk5MnZsYmp1am5pem04In0.LTlGjtYT-0MdURTgGk9fDA';

  @override
  void initState() {
    super.initState();
    widget.formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    Event evt = Event("");

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
                //autovalidateMode: AutovalidateMode.always,
                key: widget.formKey,
                onChanged: () {
                  Form.of(primaryFocus!.context!)!.save();
                  Form.of(primaryFocus!.context!)!.validate();
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
                        validator: (String? value) {
                          return (value != null &&
                                  value == "" &&
                                  value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                        onSaved: (String? value) => evt.title = value!,
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
                          print(value.toString());
                          evt.dateEvent = value!;
                        },
                      ),

                      //Adress
                      Expanded(
                          child: MapBoxPlaceSearchWidget(
                        popOnSelect: true,
                        //popOnSelect: false,
                        apiKey: mapBoxApiKey,
                        //limit: 10,
                        searchHint: 'Where is the event ?',
                        onSelected: (place) {
                          //print("ici : "+place.toString());
                          //print("center :: "+ place.center.toString());
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
                              Navigator.pushNamed(context, '/');
                            }
                          },
                          child: const Text("Create"))
                    ]),
              ),
            )));
  }
}
