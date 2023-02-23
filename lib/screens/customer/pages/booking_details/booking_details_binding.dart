// @dart=2.9
import 'package:get/get.dart';

import '../../core.dart';

class BookingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookingDetailsController>(BookingDetailsController());
  }
}
