// @dart=2.9
import 'package:crown_city_car_hire/controllers/bookingcontroller.dart';
import 'package:crown_city_car_hire/controllers/payment_controller.dart';
import 'package:crown_city_car_hire/screens/chat/chat_controller.dart';
import 'package:crown_city_car_hire/screens/drivers/driver_home_controller.dart';
import 'package:get/get.dart';

import '../core.dart';
import 'notification/notification_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<BookingController>(BookingController());
    Get.put<NotficationController>(NotficationController());
    Get.put<HomeController>(HomeController());
    Get.put<DriverHomeController>(DriverHomeController());
    Get.put<ProfileController>(ProfileController());
    Get.put<ChatController>(ChatController());
    Get.put<PaymentController>(PaymentController());
  }
}
