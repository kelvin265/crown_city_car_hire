// @dart=2.9
import 'package:crown_city_car_hire/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../core.dart';

class PaymentScreen extends GetView<PaymentsController> {
  Future<void> _checkout() async {
    try {
      /// retrieve data from the backend
      final _paymentSheetData = await controller.fetchPaymentSheetData();

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

      Get.defaultDialog(
        content: CustomText(
          text: "Payment successfull",
        ),
      );
    } catch (e) {
      Get.defaultDialog(
        content: CustomText(
          text: "Payment canceled",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              AppBarWidget(title: "Make payments"),
              SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: _checkout,
                child: Text('Checkout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
