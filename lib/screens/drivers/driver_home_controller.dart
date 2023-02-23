// @dart=2.9
import 'package:crown_city_car_hire/controllers/customerController.dart';
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:get/get.dart';

class DriverHomeController extends GetxController {
  CustomerController customerController = Get.find();
  Rx<CustomerModel> _driverModel = CustomerModel().obs;

  CustomerModel get driver => this._driverModel.value;

  set driver(CustomerModel value) => this._driverModel.value = value;
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
}
