// @dart=2.9
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/screens/payments/widgets/payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(.1),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Payments History",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: paymentsController.payments
                .map((payment) => PaymentWidget(paymentModel: payment))
                .toList(),
          )
        ],
      ),
    );
  }
}
