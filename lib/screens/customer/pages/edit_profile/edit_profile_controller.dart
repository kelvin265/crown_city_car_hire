import 'dart:io';

import 'package:crown_city_car_hire/controllers/customerController.dart';
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  CustomerController customerController = Get.find();

  CustomerModel customer = CustomerModel();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar('Error', 'No image selected',
          backgroundColor: Colors.red[200], colorText: Colors.white);
    }
  }

  void onCustomerUploaded(CustomerModel customer) {
    customerController.customer = customer;
  }
}
