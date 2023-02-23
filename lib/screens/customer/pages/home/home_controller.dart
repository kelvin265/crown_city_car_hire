// @dart=2.9
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/controllers/customerController.dart';
import 'package:crown_city_car_hire/models/booking.dart';
import 'package:get/get.dart';

import '../../core.dart';

class HomeController extends GetxController {
  List<Car> cars = [];
  List<Car> carsAvailable = [];
  List<Dealer> dealers = [];
  Car displayCar;

  CustomerController customerController = Get.find();
  @override
  void onInit() {
    cars = carController.cars;

    dealers = DealerService().getDealerList();
    super.onInit();
  }

  removeBookedCar(List<Car> allCars) {
    carsAvailable.clear();
    Car car;
    int count = allCars.length;
    for (var i = 0; i < count; i++) {
      car = allCars[i];
      if (car.status == "0") {
        carsAvailable.add(car);
      }
    }
  }

  //showing booked car for home screen
  getmyBookedCar(List<BookingModel> myBookings) {
    BookingModel booking;
    int count = myBookings.length;
    if (count > 0) {
      for (var i = 0; i < count; i++) {
        booking = myBookings[i];
        _checkingBookedCar(booking.carId);
      }
    }
  }

  _checkingBookedCar(String bookedCarId) {
    int count = cars.length;
    for (var i = 0; i < count; i++) {
      if (bookedCarId == cars[i].id) {
        displayCar = cars[i];
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
