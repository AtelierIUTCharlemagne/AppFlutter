import 'package:atelier2_app_mobile/model/user.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:jwt_decoder/jwt_decoder.dart';

//Liste des tâches pour le moment gènèré avec faker

class CurrentUser {
  static late User usr;

  CurrentUser();

  factory CurrentUser.fromJsonConnection(Map<String, dynamic> json) {
    String yourToken = json['data'];
    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

    //print('jwt is decoded : ');
    //print(decodedToken.toString());
    CurrentUser.usr = User.fromJson(decodedToken);
    return CurrentUser();
  }
}
