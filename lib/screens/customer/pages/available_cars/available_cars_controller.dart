import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:get/get.dart';

import '../../core.dart';

class AvailableCarsController extends GetxController {
  List<Car> carsAvailable = [];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  removeBookedCar() {
    carsAvailable.clear();
    Car car;
    int count = carController.cars.length;
    for (var i = 0; i < count; i++) {
      car = carController.cars[i];
      if (car.status == "0") {
        carsAvailable.add(car);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
