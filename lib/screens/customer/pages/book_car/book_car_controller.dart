// @dart=2.9
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../core.dart';

class BookCarController extends GetxController {
  var index = ''.obs;
  var number = '1'.obs;
  var price = ''.obs;

  var isloading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addBookingDetails(Car car) {
    String id = Uuid().v4();
    bookingController.currentBooking.id = id;
    bookingController.currentBooking.cost =
        int.parse(number.value) * double.parse(car.price);

    bookingController.currentBooking.carId = car.id;
    bookingController.currentBooking.dateRange = int.parse(number.value);
    bookingController.currentBooking.date =
        DateTime.now().millisecondsSinceEpoch.toString();
    bookingController.currentBooking.clientId = customerController.customer.id;
  }
}
