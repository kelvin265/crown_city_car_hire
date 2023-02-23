// @dart=2.9
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:crown_city_car_hire/models/payments.dart';

class PaymentWidget extends StatelessWidget {
  final PaymentsModel paymentModel;

  const PaymentWidget({Key key, this.paymentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.green.withOpacity(.5), blurRadius: 15)
          ]),
      child: Wrap(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomText(
                  text: 'DAYS',
                  color: Colors.grey,
                ),
              ),
              CustomText(
                text:
                    '${bookingController.returnBookingDays(paymentModel.bookingId)}',
                color: Colors.black,
                weight: FontWeight.bold,
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomText(
                  text: '\$ ${paymentModel.amount}',
                  color: Colors.black,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
          Divider(),
          Column(
            children: carController.cars.map((car) {
              return car.id == paymentModel.carId
                  ? ListTile(
                      title: CustomText(
                        text: car.brand + ' ' + car.model,
                      ),
                      trailing: CustomText(
                        text: "\$ ${paymentModel.amount}",
                      ),
                    )
                  : Container();
            }).toList(),
          ),
          Divider(),
          ListTile(
            title: CustomText(
              text: _returnDate(),
              color: Colors.grey,
            ),
            trailing: CustomText(
              text: paymentModel.status,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  String _returnDate() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(paymentModel.createdAt);
    return timeago.format(date);
  }
}
