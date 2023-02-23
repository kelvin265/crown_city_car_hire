import 'package:crown_city_car_hire/utils/utils.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  String receiver;
  String idUser;
  String urlAvatar;
  String username;
  String message;
  DateTime createdAt;

  Message(
      {this.idUser,
      this.receiver,
      this.urlAvatar,
      this.username,
      this.message,
      this.createdAt});

  Message.fromMap(Map<String, dynamic> data) {
    idUser = data['idUser'];
    receiver = data['receiver'];
    urlAvatar = data['urlAvatar'];
    username = data['username'];
    message = data['message'];
    createdAt = Utils.toDateTime(data['createdAt']);
  }

  Map<String, dynamic> toJson() => {
        'receiver': receiver,
        'idUser': idUser,
        'urlAvatar': urlAvatar,
        'username': username,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt)
      };
}
