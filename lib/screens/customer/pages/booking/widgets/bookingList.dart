import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/screens/customer/pages/booking/widgets/bookingTile.dart';

import 'package:flutter/material.dart';

class BookingList extends StatefulWidget {
  @override
  _BookingListState createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  @override
  Widget build(BuildContext context) {
    final bookings = bookingController.myBookings;

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return BookingTile(booking: bookings[index]);
      },
    );
  }
}
