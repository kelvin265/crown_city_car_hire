import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crown_city_car_hire/utils/utils.dart';

class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class CustomerModel {
  String id;
  String name;
  String email;
  String number;
  String gender;
  String birthday;
  String type = 'customer';
  String balance = "0.0";
  String location;
  String image;
  DateTime lastMessageTime = DateTime.now();

  CustomerModel({
    this.id,
    this.name,
    this.email,
    this.number,
    this.gender,
    this.type,
    this.image,
    this.birthday,
    this.balance,
    this.location,
    this.lastMessageTime,
  });

  CustomerModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    this.id = doc.id;
    this.name = doc['name'];
    this.email = doc['email'];
    this.number = doc['number'];
    this.gender = doc['gender'];
    this.type = doc['type'];
    this.birthday = doc['birthday'];
    this.balance = doc['balance'] ?? "";
    this.location = doc['location'] ?? "";
    this.image = doc['image'] ?? "";
    this.lastMessageTime = Utils.toDateTime(doc['lastMessageTime']);
  }
  CustomerModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    number = data['number'];
    gender = data['gender'];
    birthday = data['birthday'];
    type = data['type'];
    location = data['location'];
    image = data['image'];
    this.lastMessageTime = Utils.toDateTime(data['lastMessageTime']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'number': number,
      'gender': gender,
      'type': type,
      'birthday': birthday,
      'balance': balance,
      'location': location,
      'image': image,
      'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
    };
  }
}
