// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:atelier2_app_mobile/model/User.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:atelier2_app_mobile/model/Event.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:faker/faker.dart';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

//Liste des tâches pour le moment gènèré avec faker

class CurrentUser {
  static late User usr;

  CurrentUser();

  factory CurrentUser.fromJsonConnection(Map<String, dynamic> json) {
    String yourToken = json['data'];
    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

    print('jwt is decoded : ');
    print(decodedToken.toString());
    CurrentUser.usr = User.fromJson(decodedToken);
    return CurrentUser();
  }
}
