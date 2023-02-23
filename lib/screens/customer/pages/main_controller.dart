// @dart=2.9
import 'package:crown_city_car_hire/controllers/authController.dart';
import 'package:crown_city_car_hire/controllers/customerController.dart';
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final pageController = PageController();
  final animationDuration = Duration(milliseconds: 300);

  AuthController authController = Get.find();
  CustomerController customerController = Get.find();
  CustomerModel customerModel;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // var isLoading = false.obs;
  // Future retrieveCustomerDetails(String id) async {
  //   isLoading.value = true;
  //   try {
  //     customerModel = await Database().getCustomer(authController.user.uid);
  //     customerController.customer = customerModel;
  //   } catch (e) {
  //     Get.snackbar('FAILED TO LOAD CUSTOMER DETAILS', e.toString());
  //   }
  //   isLoading.value = false;
  // }

  void retrieveCustomerInfo() {}
  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
