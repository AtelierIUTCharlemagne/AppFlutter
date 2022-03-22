import 'User.dart';

class Event {
  late int id; 
  late int token; 
  late String title;
  late String address;
  late String location;
  late int authorId;
  late DateTime dateEvent;
  late DateTime updatedAt;

  //Constructor
  Event(this.title){
    id = -1;
    token = -1;
    address = "Nancy";
    location = "123456, 123456";
    authorId = -1;
    dateEvent = DateTime.now();
    updatedAt = DateTime.now();

  }
  ///TODO
  getOrganisateurName(){
    return "Jules";
  }


  join(User u1){
    //TODO
  }


}