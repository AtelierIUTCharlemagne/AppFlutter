import 'package:dio/dio.dart';

class User {
  String name;
  String mail;
  String password;
  late bool completed;
  late DateTime lastConnected;

  //Constructor
  User(this.name, this.mail, this.password) {
    completed = false;
    lastConnected = DateTime.now();
  }

  join() {
    completed = true;
  }

  exist() {
    return true;
  }

  @override
  toString() {
    return "Utilisateur : $name, mail : $mail, identified by : $password";
  }

  getTest() async {
    print(toString());
    try {
      var response = await Dio().get('http://docketu.iutnc.univ-lorraine.fr:62349/');
      print(response);
    } catch (e) {
      print(e);
    }
  }


  /**
   * Call our api to register our user in db
   */
  register() async {
    print(toString());
    try {
      var response = await Dio()
          .post('http://docketu.iutnc.univ-lorraine.fr:62349/users/signup', data: {'username': name, 'email': mail, 'passwd':password});
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
