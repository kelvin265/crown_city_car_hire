// @dart=2.9
import 'package:crown_city_car_hire/controllers/authController.dart';
import 'package:crown_city_car_hire/controllers/customerController.dart';
import 'package:crown_city_car_hire/screens/authentication/login/login.dart';
import 'package:crown_city_car_hire/screens/customer/controllers/carController.dart';
import 'package:crown_city_car_hire/screens/customer/core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final CustomerController customerController = Get.put(CustomerController());
  final CarController carController = Get.put(CarController());
  // final PaymentsController paymentsController = Get.put(PaymentsController());

  @override
  Widget build(BuildContext context) {
    if (authController.user?.uid != null) {
      return MainView();
    } else {
      return LoginScreen();
    }
  }
}
