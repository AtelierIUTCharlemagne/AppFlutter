// ignore_for_file: file_names

import 'dart:convert';

import 'package:atelier2_app_mobile/data/CurrentUser.dart';
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

  @override
  toString() {
    return "Utilisateur : $name, mail : $mail, identified by : $password";
  }

  /// Call our api to register our user in db
  /// @phorcys-jules
  register() async {
    try {
      var response = await Dio().post(
          //'http://docketu.iutnc.univ-lorraine.fr:62349/users/signup',
          'http://localhost:62349/users/signup',
          data: {'username': name, 'email': mail, 'passwd': password});
      //User u = User(name, mail, password);
      //current user = u;
      //pb /signup ne rtourne pas l'id de l'user

      //connect va aller set le current user
      connect();

      print(response);
    } catch (e) {
      print(e);
    }
  }

  /// Call our api to connect our user
  /// @phorcys-jules
  connect() async {
    print("connection....");
    try {
      final response = await http.post(
          Uri.parse('http://localhost:62349/users/signin'),
          //Uri.parse('http://docketu.iutnc.univ-lorraine.fr:62349/users/signin'),
          body: {'email': mail, 'passwd': password});
      if (response.statusCode == 200) {
        CurrentUser.fromJsonConnection(jsonDecode(response.body));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Call our api to update mail, name & password
  /// @phorcys-jules
  update() async {
    try {
      var response = await Dio().patch(
          //'http://docketu.iutnc.univ-lorraine.fr:62349/users/update',
          'http://localhost:62349/users/update',
          data: {'username': name, 'email': mail, 'passwd': password, 'id': CurrentUser.usr.id});
      //User u = User(name, mail, password);
      //current user = u;
      //pb /update ne rtourne pas l'id de l'user

      //connect va aller set le current user
      connect();

      print(response);
    } catch (e) {
      print(e);
    }
  }


  ///DEBUG TOOL faster dev
    connectDefault() async {
    print("connection....");
    try {
      final response = await http.post(
          Uri.parse('http://localhost:62349/users/signin'),
          //Uri.parse('http://docketu.iutnc.univ-lorraine.fr:62349/users/signin'),
          body: {'email': 'jul@mail.fr', 'passwd': 'Jules2'});
      if (response.statusCode == 200) {
        CurrentUser.fromJsonConnection(jsonDecode(response.body));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
