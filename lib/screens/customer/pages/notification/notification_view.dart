import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/screens/customer/pages/booking/widgets/bookingList.dart';
import 'package:crown_city_car_hire/screens/customer/pages/notification/widgets/notificationList.dart';
import 'package:crown_city_car_hire/screens/customer/shared/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    notficationController.selectMyNotifications();
    print(notficationController.myNotifications.length);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text(
                "My Notifications",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: NotificationList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
