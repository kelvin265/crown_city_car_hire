import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/controllers/customerController.dart';
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:crown_city_car_hire/screens/authentication/login/login.dart';
import 'package:crown_city_car_hire/screens/customer/core.dart';
import 'package:crown_city_car_hire/screens/wrapper.dart';
import 'package:crown_city_car_hire/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser;

  User get user => _firebaseUser?.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser?.bindStream(_auth.authStateChanges());
  }

  Future<bool> createUser(
      String name,
      String email,
      String number,
      String gender,
      String birthday,
      String balance,
      String location,
      String image,
      String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create a customer in firestore
      CustomerModel _customer = CustomerModel(
          id: _authResult.user.uid,
          name: name,
          email: email,
          number: number,
          gender: gender,
          birthday: birthday,
          balance: balance,
          location: location,
          image: image,
          type: 'customer',
          lastMessageTime: DateTime.now());

      if (await Database().createNewCustomer(_customer)) {
        //customer created successfully
        customerController.customer = _customer;
      }
      Get.offAll(() => MainView());

      return true;
    } catch (e) {
      Get.snackbar("Error creating an account!", e.toString(),
          backgroundColor: Colors.red[200],
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      await retrieveCustomerDetails(_authResult.user.uid);
      print(_authResult.user.uid);
      return true;
    } catch (e) {
      Get.snackbar("Error signing in!", e.toString(),
          backgroundColor: Colors.red[200],
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  Future retrieveCustomerDetails(String id) async {
    try {
      CustomerModel customerModel = await Database().getCustomer(id);
      customerController.customer = customerModel;
      print(customerController.customer.name);
    } catch (e) {
      Get.snackbar('FAILED TO LOAD CUSTOMER DETAILS', e.toString());
    }
  }

  void singOut() async {
    try {
      await _auth.signOut();
      customerController.clear();
      Get.offAll(Wrapper());
    } catch (e) {
      Get.snackbar("Error singing out!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
