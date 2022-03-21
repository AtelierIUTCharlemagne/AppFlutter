import 'package:dio/dio.dart';
class User {
  String name;
  String mail;
  String password;
  late bool completed;
  late DateTime createdAt;
  late DateTime updatedAt;

  //Constructor
  User(this.name, this.mail, this.password) {
    completed =false;
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
  }

  join(){
    completed = true;
  }
  exist(){
    return true;
  }
  /**
   * Call our api to register our user in db
   */
  register() async {
    try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
  }


}