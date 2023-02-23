import 'dart:convert';
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../../core.dart';

class PaymentsController extends GetxController {
  String collection = "payments";
  Map<String, dynamic> paymentIntentData;

  var driverCost = 2.0.obs;
  var totalCost = 0.0.obs;
  var gotDriver = false.obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    totalCost.value = bookingController.currentBooking.cost;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkout({Car car}) async {
    try {
      isLoading.value = true;
      if (gotDriver.value == false) {
        bookingController.currentBooking.driverOption = 'No';
        bookingController.currentBooking.status = 'On-going';
      } else {
        bookingController.currentBooking.driverOption = 'Yes';
        bookingController.currentBooking.status = 'On-going';
      }

      /// retrieve data from the backend
      final _paymentSheetData = await fetchPaymentSheetData();

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          applePay: true,
          googlePay: true,
          style: ThemeMode.dark,
          testEnv: true,
          merchantCountryCode: 'MW',
          merchantDisplayName: 'Kelvin',
          customerId: _paymentSheetData['customer'],
          paymentIntentClientSecret: _paymentSheetData['paymentIntent'],
          customerEphemeralKeySecret: _paymentSheetData['ephemeralKey'],
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      bookingController.addCarToBooking(bookingController.currentBooking,
          car: car);
      addToPayments(paymentStatus: 'successful');
      isLoading.value = false;
      Get.offAll(() => MainView());
      Get.defaultDialog(
        content: CustomText(
          text: "Payment successfull",
        ),
      );
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(
        content: CustomText(
          text: "Payment canceled",
        ),
      );
    }
  }

  Future<Map<String, dynamic>> fetchPaymentSheetData() async {
    try {
      final _url = Uri.parse(
          'https://us-central1-crown-city-b8a1b.cloudfunctions.net/stripePayment?amount=${bookingController.currentBooking.cost.toInt() * 100}');
      final response =
          await http.get(_url, headers: {'Content-Type': 'application/json'});

      paymentIntentData = json.decode(response.body);
      return paymentIntentData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> addToPayments({String paymentStatus}) async {
    String id = Uuid().v1();
    await firebaseFirestore.collection(collection).doc(id).set({
      'id': id,
      'clientId': bookingController.currentBooking.clientId,
      'status': paymentStatus,
      'bookingId': bookingController.currentBooking.id,
      'carId': bookingController.currentBooking.carId,
      'amount': bookingController.currentBooking.cost,
      'createdAt': DateTime.now().millisecondsSinceEpoch
    });
  }
}
