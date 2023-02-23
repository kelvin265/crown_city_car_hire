import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/models/booking.dart';
import 'package:crown_city_car_hire/screens/customer/core.dart';
import 'package:crown_city_car_hire/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  static BookingController instance = Get.find();
  RxList<BookingModel> bookings = RxList<BookingModel>([]);
  RxList<BookingModel> myBookings = RxList<BookingModel>([]);
  Rx<BookingModel> _currentBooking = BookingModel().obs;

  BookingModel get currentBooking => this._currentBooking.value;

  set currentBooking(BookingModel value) => this._currentBooking.value = value;

  void clearCurrentBooking() {
    this._currentBooking.value = BookingModel();
  }

  var totalBookingPrice = 0.0.obs;

  @override
  void onReady() {
    bookings.bindStream(Database().listenToBookings());
    super.onReady();
  }

  int returnBookingDays(String id) {
    int count = bookings.length;
    for (var i = 0; i < count; i++) {
      if (bookings[i].id == id) {
        return bookings[i].dateRange;
      }
    }

    return 0;
  }

  getMyBookings(List<BookingModel> allBookings) {
    myBookings.clear();
    BookingModel booking;
    int count = allBookings.length;
    for (var i = 0; i < count; i++) {
      booking = allBookings[i];
      if (booking.clientId == customerController.customer.id ||
          booking.driverId == customerController.customer.id) {
        myBookings.add(booking);
      }
    }
    print("my bookings are this much " + myBookings.length.toString());
  }

  Future<void> addCarToBooking(BookingModel bookingModel, {Car car}) async {
    try {
      await Database().createNewBooking(bookingModel);
      car.status = '1';
      carController.updateCar(car);
      Get.snackbar("Car booked", "Car was booked successfully");
    } catch (e) {
      Get.snackbar("Error", "Cannot book this car");
      debugPrint(e.toString());
    }
  }
}
