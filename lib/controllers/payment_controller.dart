// @dart=2.9
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/models/payments.dart';
import 'package:crown_city_car_hire/screens/payments/payments.dart';
import 'package:crown_city_car_hire/utils/helpers/showLoading.dart';
import 'package:get/get.dart';
import 'package:crown_city_car_hire/constants/constants.dart';

class PaymentController extends GetxController {
  static PaymentController instance = Get.find();
  String collection = "payments";

  List<PaymentsModel> payments = [];

  @override
  void onReady() async {
    super.onReady();
  }

  getPaymentHistory() {
    showLoading();
    payments.clear();
    firebaseFirestore
        .collection(collection)
        .where("clientId", isEqualTo: customerController.customer.id)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((doc) {
        PaymentsModel payment = PaymentsModel.fromMap(doc.data());
        payments.add(payment);
      });

      logger.i("length ${payments.length}");
      dismissLoadingWidget();
      Get.to(() => PaymentsScreen());
    });
  }
}
