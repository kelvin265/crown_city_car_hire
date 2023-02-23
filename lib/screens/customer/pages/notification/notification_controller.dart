import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/screens/customer/models/notification.dart';
import 'package:crown_city_car_hire/services/database.dart';

import 'package:get/get.dart';

class NotficationController extends GetxController {
  static NotficationController instance = Get.find();
  List<NotificationModel> myNotifications = [];
  Rx<NotificationModel> _notification = NotificationModel().obs;

  RxList<NotificationModel> notifications = RxList<NotificationModel>();

  NotificationModel get notification => _notification.value;

  set notification(NotificationModel value) => _notification.value = value;

  void clear() {
    _notification.value = NotificationModel();
  }

  @override
  void onInit() {
    notifications.bindStream(Database().getNotifications());
    super.onInit();
  }

  selectMyNotifications() {
    myNotifications.clear();
    int count = notifications.length;
    for (var i = 0; i < count; i++) {
      if (notifications[i].clientId == customerController.customer.id) {
        myNotifications.add(notifications[i]);
      }
    }
    print(count);
  }
}
