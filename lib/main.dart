// @dart=2.9
import 'package:crown_city_car_hire/screens/customer/pages/main_binding.dart';
import 'package:crown_city_car_hire/screens/customer/routes/app_pages.dart';
import 'package:crown_city_car_hire/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  Stripe.publishableKey =
      'pk_test_51JPhi2FOiDe9wKes0g3obkJB7cL1o1AusiyFQ0Bv5tKEzPvCm8xekZJxcoqcQgGvkaHvGFHLaPVWpQFwmsyu9fPg00E9Han4TD';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crown City Car Hire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Duration(milliseconds: 230),
      initialBinding: MainBinding(),
      home: Wrapper(),
      getPages: AppPages.routes,
    );
  }
}
