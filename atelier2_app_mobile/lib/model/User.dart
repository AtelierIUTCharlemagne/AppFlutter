import 'dart:convert';
import 'package:atelier2_app_mobile/data/current_user.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class User {
  late int id;
  String name;
  String mail;
  String password;
  late DateTime lastConnected;

  //Constructor
  User(this.name, this.mail, this.password) {
    lastConnected = DateTime.now();
  }

  factory User.fromJson(Map<String, dynamic> json) {
    User u = User(json['username'], json['email'], 'hidden');
    u.id = json['id'];
    return u;
  }

  ///TODO
  join() {}

  exist() {
    return true;
  }

  @override
  toString() {
    return "Utilisateur : $name, mail : $mail, identified by : $password";
  }

  /// Call our api to register our user in db
  /// @phorcys-jules
  register() async {
    try {
      var response = await Dio().post(
          'http://docketu.iutnc.univ-lorraine.fr:62349/users/signup',
          data: {'username': name, 'email': mail, 'passwd': password});
      return response;
      //print(response);
    } catch (e) {
      //print(e);
    }
  }

  /// Call our api to connect our user
  /// @phorcys-jules
  connect(String mail, String password) async {
    //print("connection....");
    try {
      final response = await http.post(
          Uri.parse('http://docketu.iutnc.univ-lorraine.fr:62349/users/signin'),
          body: {'email': mail, 'passwd': password});
      //print(response.statusCode);
      if (response.statusCode == 200) {
        CurrentUser.fromJsonConnection(jsonDecode(response.body));
        //print(response.body);
        //print("the current user is now : " + CurrentUser.usr.toString());
        return true;
      } else {
        return false;
        // Erreur de connexion, surement pas les bons id
      }
    } catch (e) {
      //print(e);
    }
  }
}
