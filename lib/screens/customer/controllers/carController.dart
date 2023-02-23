import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/screens/customer/core.dart';
import 'package:crown_city_car_hire/services/database.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  static CarController instance = Get.find();
  RxList<Car> cars = RxList<Car>([]);

  void onReady() {
    cars.bindStream(Database().getAllCars());
    super.onReady();
  }

  final CollectionReference brewCollection =
      firebaseFirestore.collection('cars');

  Future<void> updateCar(Car car) async {
    return await brewCollection.doc(car.id).update(car.toMap());
  }
}
