import 'package:atelier2_app_mobile/data/EventsCollection.dart';
import 'package:atelier2_app_mobile/model/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:validators/validators.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmailValid(String email) {
    RegExp pattern = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return pattern.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Consumer<EventsCollection>(builder: (context, tasks, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Reunionous"),
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
                          hintText: 'What do people call you ?',
                          labelText: 'Name *',
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
                          hintText: 'How we contact you ?',
                          labelText: 'Mail *',
                        ),
                        onSaved: (String? value) {
                          // Vérif si le mail exit déja ?
                        },
                        validator: (String? value) {
                          return (! isEmailValid(value!))
                              ? 'This is not a valid Email'
                              : null;
                        },
                      ),
                      //Password
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password_outlined),
                          hintText: 'Keep it secret',
                          labelText: 'Password *',
                        ),
                        onSaved: (String? value) {
                          // si le deuxième mdp est entré, verif si ils sont =
                        },
                        validator: (String? value) {
                          return (! isPasswordValid(value!))
                              ? 'This is not a valid Password'
                              : null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password_outlined),
                          hintText: 'Keep it secret',
                          labelText: 'Confirm password *',
                        ),
                        onSaved: (String? value) {
                          // si le deuxième mdp est entré, verif si ils sont =
                        },
                        validator: (String? value) {
                          return (! isPasswordValid(value!))
                              ? 'This is not a valid Password'
                              : null;
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // TODO regist user
                              Navigator.pushNamed(context, '/');
                              User(_formKey, mail, password)
                            }
                          },
                          child: Text("Register"))
                    ]),
              ))));
    });
  }
}
