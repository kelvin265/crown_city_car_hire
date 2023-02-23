import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/models/booking.dart';
import 'package:crown_city_car_hire/screens/customer/models/car.dart';
import 'package:crown_city_car_hire/screens/customer/pages/xcore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingTile extends StatelessWidget {
  final BookingModel booking;
  BookingTile({this.booking});
  Car car;
  selectCarImage() {
    int count = carController.cars.length;
    for (var i = 0; i < count; i++) {
      if (carController.cars[i].id == booking.carId) {
        car = carController.cars[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    selectCarImage();
    return GestureDetector(
      onTap: () {
        Get.to(
          () => BookingDetailsView(),
          binding: BookingDetailsBinding(),
          arguments: booking,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: .1,
          margin: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(car.images[0]),
            ),
            title: Text("${car.model}, ${car.brand}"),
            subtitle:
                Text('For ${booking.dateRange} day(s), since ${booking.date}'),
          ),
        ),
      ),
    );
  }
}
