// @dart=2.9
import 'package:get/get.dart';

import '../../core.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditProfileController>(EditProfileController());
  }
}
