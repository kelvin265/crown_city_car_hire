// @dart=2.9
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  static CustomerController instance = Get.find();
  Rx<CustomerModel> _customerModel = CustomerModel().obs;

  CustomerModel get customer => this._customerModel.value;

  set customer(CustomerModel value) => this._customerModel.value = value;

  void clear() {
    this._customerModel.value = CustomerModel();
  }
}
