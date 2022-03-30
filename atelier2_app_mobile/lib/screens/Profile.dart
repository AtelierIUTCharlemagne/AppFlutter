import 'package:atelier2_app_mobile/data/CurrentUser.dart';
import 'package:atelier2_app_mobile/model/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:validators/validators.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isPasswordValid(String password) => password.length >= 6;

  @override
  Widget build(BuildContext context) {
    User usr = User("", "", "");
    final _formKey = GlobalKey<FormState>();

      return Scaffold(
          appBar: AppBar(
            title: const Text("Mon profile"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Profile');
                },
              )
            ],
          ),
          body: Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: FocusTraversalGroup(
                  child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                onChanged: () {
                  Form.of(primaryFocus!.context!)!.save();
                  //Form.of(primaryFocus!.context!)!.validate();
                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Nom
                      TextFormField(
                        initialValue: CurrentUser.usr.name,
                        decoration: const  InputDecoration(
                          icon: Icon(Icons.person_outlined),
                          labelText: 'Name',
                        ),
                        validator: (String? value) {
                          return (value != null &&
                                  value == "" &&
                                  value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                        onSaved: (String? value) => usr.name = value!,
                      ),
                      //Mail
                      TextFormField(
                        initialValue: CurrentUser.usr.mail,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.mail_outlined),
                          labelText: 'Mail *',
                        ),
                        // Vérif si le mail exit déja ?
                        onSaved: (String? value) => usr.mail = value!,
                        validator: (String? value) {
                          return (!isEmail(value!))
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
                        onSaved: (String? value) => usr.password = value!,
                        validator: (String? value) {
                          return (!isPasswordValid(value!))
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
                        // si le deuxième mdp est entré, verif si ils sont =
                        onSaved: (String? value) => usr.password = value!,
                        validator: (String? value) {
                          return (!isPasswordValid(value!))
                              ? 'This is not a valid Password'
                              : null;
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      //tmp
                      Text("id : ${CurrentUser.usr.id}"),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              usr.update();
                              Navigator.pushNamed(context, '/');
                            }
                          },
                          child: const Text("Confirm changes"))
                    ]),
              )))
              );}
}