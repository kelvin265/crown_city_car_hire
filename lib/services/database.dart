import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/controllers/customerController.dart';
import 'package:crown_city_car_hire/models/booking.dart';
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:crown_city_car_hire/models/message.dart';
import 'package:crown_city_car_hire/models/rate.dart';
import 'package:crown_city_car_hire/screens/customer/core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';

import 'package:crown_city_car_hire/screens/customer/models/notification.dart';
import 'package:uuid/uuid.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CustomerController customerController = Get.find();
  Future<bool> createNewCustomer(CustomerModel customer) async {
    try {
      await _firestore
          .collection("customers")
          .doc(customer.id)
          .set(customer.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<CustomerModel> getCustomer(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("customers").doc(uid).get();
      return CustomerModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future updateCustomerDetails(
      CustomerModel customer, Function onCustomerUploaded,
      {File localFile}) async {
    if (localFile != null) {
      print("uploading image");

      var fileExtension = path.extension(localFile.path);
      var filename = basename(localFile.path);
      print(filename);

      final Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('users/images/$filename$fileExtension');

      await firebaseStorageRef.putFile(localFile).catchError((onError) {
        print(onError);
      });

      String url = await firebaseStorageRef.getDownloadURL();
      print('download url: $url');
      //upload food

      _uploadCustomer(customer, onCustomerUploaded, imageUrl: url);
    } else {
      print('.... skipping image upload');
      _uploadCustomer(customer, onCustomerUploaded);
    }
  }

  _uploadCustomer(CustomerModel customer, Function onCustomerUploaded,
      {String imageUrl}) async {
    CollectionReference customerRef =
        FirebaseFirestore.instance.collection('customers');

    if (imageUrl != null) {
      customer.image = imageUrl;
    }

    await customerRef.doc(customer.id).update(customer.toMap());

    onCustomerUploaded(customer);

    print('updated customer with id: ${customer.id}');
    Get.snackbar('Success', 'Details updated successfully',
        backgroundColor: Colors.green[200], colorText: Colors.white);
  }

  //cars

  Stream<List<Car>> getAllCars() {
    return _firestore.collection('cars').snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((item) => Car.fromMap(item.data())).toList());
  }

  //cars

  Stream<List<CustomerModel>> getChatUsers() {
    return _firestore
        .collection('customers')
        .orderBy(UserField.lastMessageTime, descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .where((doc) {
              bool result = false;
              int count = bookingController.myBookings.length;
              for (var i = 0; i < count; i++) {
                if (customerController.customer.type == 'driver') {
                  if (bookingController.myBookings[i].clientId == doc['id']) {
                    result = true;
                  }
                } else {
                  if (bookingController.myBookings[i].driverId == doc['id']) {
                    result = true;
                  }
                }
              }
              return result;
            })
            .map((item) => CustomerModel.fromMap(item.data()))
            .toList());
  }

  //notifications

  Stream<List<NotificationModel>> getNotifications() {
    return _firestore.collection('notifications').snapshots().map(
        (querySnapshot) => querySnapshot.docs
            .map((item) => NotificationModel.fromMap(item.data()))
            .toList());
  }
  // rates

  Future<bool> createRate(Rate rate) async {
    try {
      await _firestore.collection("rates").doc(rate.id).set(rate.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // booking

  Future<bool> createNewBooking(BookingModel booking) async {
    try {
      await _firestore
          .collection("bookings")
          .doc(booking.id)
          .set(booking.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<List<BookingModel>> listenToBookings() => firebaseFirestore
      .collection('bookings')
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((item) => BookingModel.fromMap(item.data()))
          .toList());

  // booking end

  //messages
  Future uploadMessage(String receiver, String message) async {
    final refMessages = FirebaseFirestore.instance.collection('messages');

    var docId = Uuid().v4();

    final newMessage = Message(
        receiver: receiver,
        idUser: customerController.customer.id,
        urlAvatar: customerController.customer.image,
        username: customerController.customer.name,
        message: message,
        createdAt: DateTime.now());

    await refMessages.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('customers');
    await refUsers
        .doc(docId)
        .update({UserField.lastMessageTime: DateTime.now()});
  }

  Stream<List<Message>> getMessages(String receiver) =>
      FirebaseFirestore.instance
          .collection('messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .where((doc) {
                bool result = false;
                if (doc['idUser'] == customerController.customer.id &&
                    doc['receiver'] == receiver) {
                  result = true;
                } else if (doc['idUser'] == receiver &&
                    doc['receiver'] == customerController.customer.id) {
                  result = true;
                }
                return result;
              })
              .map((item) => Message.fromMap(item.data()))
              .toList());
}
