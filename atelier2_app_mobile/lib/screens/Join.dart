import 'package:atelier2_app_mobile/model/Event.dart';
import 'package:atelier2_app_mobile/model/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:validators/validators.dart';

class Join extends StatefulWidget {
  const Join({Key? key}) : super(key: key);

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  bool isPasswordValid(String password) => password.length >= 6;

  @override
  Widget build(BuildContext context) {
    Event evt = Event();
    final _formKey = GlobalKey<FormState>();

    return AlertDialog(
      scrollable: true,
      title: const Text('Login'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'token',
                  icon: Icon(Icons.confirmation_number_outlined),
                ),
                onSaved: (String? value) => evt.token = value!,
              ),
              const Padding(padding: EdgeInsets.only(top: 15.0)),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      evt.join();
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: const Text("Join")),
            ],
          ),
        ),
      ),
    );
  }
}
