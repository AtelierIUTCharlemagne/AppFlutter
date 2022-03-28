import 'package:atelier2_app_mobile/model/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:validators/validators.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  bool isPasswordValid(String password) => password.length >= 6;

  @override
  Widget build(BuildContext context) {
    User usr = User("", "", "");
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
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                  onSaved: (String? value) => usr.mail = value!,
                  validator: (String? value) {
                    return (!isEmail(value!))
                        ? 'This is not a valid email'
                        : null;
                  },
                ),
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
                const Padding(padding: EdgeInsets.only(top: 15.0)),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print("mail : " + usr.mail + "pass " + usr.password);
                        if (await usr.connect()) {
                          Navigator.pushReplacementNamed(context, '/');
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: const Text("Connect"))
              ]),
        ),
      ),
    );
  }
}
    /*

          body: Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: FocusTraversalGroup(
                  child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                onChanged: () {
                  Form.of(primaryFocus!.context!)!.save();
                  //Form.of(primaryFocus!.context!)!.validate();
                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Mail
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.mail_outlined),
                          hintText: 'How we contact you ?',
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
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              //usr.Connect();
                              Navigator.pushNamed(context, '/');
                            }
                          },
                          child: const Text("Connect"))
                    ]),
              )))
              );}
}
*/