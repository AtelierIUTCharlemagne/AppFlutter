// ignore_for_file: file_names

import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_field/date_field.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool isTitleValid(String password) => password.length >= 6;
  //bool isDateValid(DateTime date) => Limite ?

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Consumer<EventsCollection>(builder: (context, tasks, child) {
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
                key: _formKey,
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
                      ),
                      //Mail
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.mail_outlined),
                          hintText: 'Telle us more ?',
                          labelText: 'Descritpion *',
                        ),
                        validator: (String? value) {
                          /*
                          return (! isEmailValid(value!))
                              ? 'This is not a valid Email'
                              : null;
                              */
                        },
                      ),
                      DateTimeFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.event),
                          labelText: 'Date *',
                        ),
                        mode: DateTimeFieldPickerMode.dateAndTime,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                      ),
                      //Adress
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.location_pin),
                          hintText: 'Where is the event ?',
                          labelText: 'Place',
                        ),
                        validator: (String? value) {
                          /*
                          return (! isEmailValid(value!))
                              ? 'This is not a valid Email'
                              : null;
                              */
                        },
                      ),



                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // TODO message confirmation ?
                              Navigator.pushNamed(context, '/');
                            }
                          },
                          child: const Text("Create"))
                    ]),
                    ),
                    )));
    });
  }
}
