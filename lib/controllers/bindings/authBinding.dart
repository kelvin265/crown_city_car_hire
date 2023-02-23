// @dart=2.9
import 'package:crown_city_car_hire/controllers/authController.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
