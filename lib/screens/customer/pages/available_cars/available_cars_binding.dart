// @dart=2.9
import '../../core.dart';
import 'package:get/get.dart';

class AvailableCarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AvailableCarsController>(AvailableCarsController());
  }
}
