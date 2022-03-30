import 'dart:io';

import 'package:atelier2_app_mobile/data/CurrentUser.dart';
import 'package:dio/dio.dart';

import 'User.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'Event.g.dart';

@JsonSerializable()
//TODO test if we can remove @JsonKey(name: 'id_events')
//when the name is the name
class Event {
  late int id;
  late String token;
  late String title;
  late String createur;
  late String address;
  late String location;
  late int authorId;
  late DateTime dateEvent;
  late DateTime updatedAt;

  //Constructor
  Event() {
    print("hey");
    title = "titre";
    id = -1;
    token = "-1";
    address = "Nancy";
    location = "42.9407051776, 147.9463177216";
    authorId = -1;
    dateEvent =
        DateTime.utc(1960); //DateTime.parse(DateTime.utc(1960).toString());
    updatedAt = DateTime.now();
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    Event e = Event();
    e.title = json['title'];
    e.createur = json['createur'];
    e.id = json['id_events'];
    e.address = json['address'];
    e.location = json['localisation'];
    e.token = json['token'];
    e.dateEvent = DateTime.parse(json['date_events']);
    e.updatedAt = DateTime.parse(json['last_update']);
    e.authorId = json['user_id_user'];
    return e;
  }

  get event => null;

  setTitle(String newTitle) {
    title = newTitle;
  }

  double getLat() {
    print("loc : " + location);
    int endIndex = location.indexOf(",");
    String sx = location.substring(0, endIndex);
    print("sx : " + sx);
    return double.parse(sx);
  }

  double getLong() {
    int startIndex = location.indexOf(", ");
    String sy = location.substring(startIndex + 2, location.length);
    print("sy : " + sy);
    return double.parse(sy);
  }

  getTitle() {
    print("return " + title);
    return title;
  }

  @override
  toString() {
    return "'title': $title" +
        "'address': $address," +
        "'localisation': $location," +
        "'date_events':  $dateEvent.toString().substring(0, dateEvent.toString().length-5)" +
        "'user_id_user': $authorId" +
        "";
  }

  /// Call our api to join an event
  /// @phorcys-jules
  join() async {
    try {
      var response = await Dio().post(
          //'http://docketu.iutnc.univ-lorraine.fr:62346/events/answer',
          'http://localhost:62346/events/answer',
          data: {'present': true, 'user_id_user': CurrentUser.usr.id, 'token': token});
          print("join success");
    } catch (e) {
      print(e);
    }
  }

  /// Call our api to create the event in db
  /// @phorcys-jules
  createEvent() async {
    print('saving event....' +
        title +
        address +
        location +
        " " +
        dateEvent.toString().substring(0, dateEvent.toString().length - 5) +
        " " +
        updatedAt.toString());
    try {
      var response = await Dio()
          //true data
          //.post('http://docketu.iutnc.univ-lorraine.fr:62345/events/create',
          .post('http://localhost:62345/events/create', data: {
        'title': title,
        'address': address,
        'localisation': location,
        'date_events':
            dateEvent.toString().substring(0, dateEvent.toString().length - 5),
        'user_id_user': CurrentUser.usr.id
      });
      print(response.statusCode);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      if (e.error.toString() == "Http status error [500]") {
        print("Les champs ne sont pas conformes");
      } else {
        if (e.error is SocketException) {
          print("Proxy error, use eduroam");
        } else {
          print(e);
        }
      }
    }
  }
}
