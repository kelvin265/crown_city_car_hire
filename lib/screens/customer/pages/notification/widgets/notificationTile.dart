import 'package:crown_city_car_hire/screens/customer/models/notification.dart';

import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  NotificationTile({this.notification});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   () => BookingDetailsView(),
        //   binding: BookingDetailsBinding(),
        //   arguments: booking,
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: .1,
          margin: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/notification-flat.png'),
            ),
            title: Text(notification.notification),
            subtitle: Text(_returnDate()),
          ),
        ),
      ),
    );
  }

  String _returnDate() {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(int.parse(notification.date));
    return timeago.format(date);
  }
}
