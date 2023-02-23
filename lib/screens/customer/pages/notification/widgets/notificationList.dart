import 'package:crown_city_car_hire/constants/controllers.dart';

import 'package:crown_city_car_hire/screens/customer/pages/notification/widgets/notificationTile.dart';

import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    notficationController.selectMyNotifications();
    print(notficationController.myNotifications.length);
    final notifications = notficationController.myNotifications;

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationTile(notification: notifications[index]);
      },
    );
  }
}
