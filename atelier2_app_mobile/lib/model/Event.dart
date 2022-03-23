import 'User.dart';
import 'package:json_annotation/json_annotation.dart';


//part 'Event.g.dart';


@JsonSerializable()
//TODO test if we can remove @JsonKey(name: 'id_events') 
//when the name is the name
class Event {
  @JsonKey(name: 'id_events')
  late int id; 
  @JsonKey(name: 'token')
  late String token; 
  @JsonKey(name: 'title')
  late String title;
  @JsonKey(name: 'address')
  late String address;
  @JsonKey(name: 'localisation')
  late String location;
  @JsonKey(name: 'user_id_user')
  late int authorId;
  @JsonKey(name: 'date_events')
  late DateTime dateEvent;
  @JsonKey(name: 'last_update')
  late DateTime updatedAt;
  @JsonKey(name: 'token')

  //Constructor
  Event(this.title){
    id = -1;
    token = "-1";
    address = "Nancy";
    location = "42.9407051776, 147.9463177216";
    authorId = -1;
    dateEvent = DateTime.now();
    updatedAt = DateTime.now();

  }

  factory Event.fromJson(Map<String, dynamic> json) {
    Event e = Event(json['title']);
    e.id = json['id_events'];
    e.address = json['address'];
    e.location = json['localisation'];
    e.token = json['token'];
    e.dateEvent = DateTime.parse(json['date_events']);
    e.updatedAt = DateTime.parse(json['last_update']);
    e.authorId = json['user_id_user'];
    return e;
  }

  double getLat(){
    print("loc : "+ location);
    int endIndex = location.indexOf(",");
    String sx = location.substring(0,  endIndex);
    print("sx : "+sx);
    return double.parse(sx);
  }

  double getLong(){
    int startIndex = location.indexOf(", ");
    String sy = location.substring(startIndex+2,  location.length);
    print("sy : "+sy);
    return double.parse(sy);
  }


  ///TODO
  getOrganisateurName(){
    return "Jules";
  }


  //TODO ajouter user à un èvent
  join(User u1){
  }


}