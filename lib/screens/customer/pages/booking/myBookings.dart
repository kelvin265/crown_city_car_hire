import 'package:crown_city_car_hire/screens/customer/pages/booking/widgets/bookingList.dart';
import 'package:crown_city_car_hire/screens/customer/shared/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class MyBookings extends StatelessWidget {
  const MyBookings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              AppBarWidget(
                title: "My Bookings",
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BookingList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
