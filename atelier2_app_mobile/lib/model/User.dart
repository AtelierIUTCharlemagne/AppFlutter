import 'package:dio/dio.dart';
class User {
  String name;
  String mail;
  String password;
  late bool completed;
  late DateTime lastConnected;

  //Constructor
  User(this.name, this.mail, this.password) {
    completed =false;
    lastConnected = DateTime.now();
  }

  join(){
    completed = true;
  }
  exist(){
    return true;
  }
  @override
  toString(){
    return "Utilisateur : $name, mail : $mail, identified by : $password";
  }


  /**
   * Call our api to register our user in db
   */
  register() async {
    print(toString());
    try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
  }


}