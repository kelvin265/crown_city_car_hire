// @dart=2.9
import 'package:get/get.dart';

import '../../core.dart';

class PaymentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentsController>(PaymentsController());
  }
}
