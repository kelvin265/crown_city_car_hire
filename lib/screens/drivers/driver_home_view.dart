import 'package:badges/badges.dart';
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/controllers/authController.dart';
import 'package:crown_city_car_hire/screens/chat/chats_page.dart';
import 'package:crown_city_car_hire/screens/customer/pages/xcore.dart';
import 'package:crown_city_car_hire/screens/drivers/driver_home_controller.dart';
import 'package:crown_city_car_hire/screens/drivers/widgets/menu_item.dart';
import 'package:crown_city_car_hire/screens/map/map_screen.dart';
import 'package:crown_city_car_hire/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DriverHomeView extends GetView<DriverHomeController> {
  DriverHomeView({Key key}) : super(key: key);
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.driver = customerController.customer;
    bookingController.getMyBookings(bookingController.bookings);
    return Scaffold(
      body: Obx(
        () => Container(
          color: Colors.white,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      buildHeader(),
                      buildTopDealers(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: CustomText(
                                text: 'Driver Progress',
                                size: 26,
                                weight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            RatingBar.builder(
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              minRating: 1,
                              initialRating: 4.0,
                              itemSize: 30,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              onRatingUpdate: (double value) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Column buildTopDealers() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.driver.name.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                    fontSize: 22),
              ),
            ],
          ),
        ),
        Container(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.to(MapScreen()),
                  child: buildMenuItem(
                      "assets/driver/google-map-direction-icon-19.jpg",
                      "Directions"),
                ),
                GestureDetector(
                    onTap: () => Get.to(() => ChatsPage()),
                    child: buildMenuItem("assets/driver/chat-png.png", "Chat")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      authController.singOut();
                    },
                    child: buildMenuItem("assets/driver/logout.png", "Logout")),
                GestureDetector(
                    onTap: () {
                      Get.to(() => ProfileView());
                    },
                    child: buildMenuItem(
                        "assets/driver/user-profile.jpg", "Profile")),
              ],
            ),
          ]),
        )
      ],
    );
  }

  Container buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(400),
            bottomRight: Radius.circular(400),
          )),
      child: Column(
        children: [
          _buildScreenHeader(),
        ],
      ),
    );
  }

  Container _buildScreenHeader() {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 90,
            child: controller.driver.image == '' ||
                    controller.driver.image == null
                ? Stack(
                    children: [
                      CircularStepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 77,
                        padding: 0,
                        selectedStepSize: 4,
                        width: 80,
                        height: 80,
                        startingAngle: 2.3,
                        selectedColor: Colors.yellow[600],
                        unselectedColor: Colors.white,
                        roundedCap: (_, __) => true,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            maxRadius: 30,
                            backgroundColor: KPrimaryColor,
                            backgroundImage: AssetImage(
                                'assets/images/users/faisal-ramdan.jpg'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: Badge(
                          shape: BadgeShape.square,
                          animationType: BadgeAnimationType.scale,
                          padding: EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2.2),
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          badgeColor: Colors.yellow[600],
                          elevation: 0,
                          badgeContent: Text(
                            'Driver',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  )
                : customerController.customer.image != ''
                    ? Stack(
                        children: [
                          CircularStepProgressIndicator(
                            totalSteps: 100,
                            currentStep: 77,
                            padding: 0,
                            selectedStepSize: 4,
                            width: 80,
                            height: 80,
                            startingAngle: 2.3,
                            selectedColor: Colors.yellow[600],
                            unselectedColor: Colors.white,
                            roundedCap: (_, __) => true,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundColor: KPrimaryColor,
                                backgroundImage:
                                    NetworkImage(controller.driver.image),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 0,
                            child: Badge(
                              shape: BadgeShape.square,
                              animationType: BadgeAnimationType.scale,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2.2),
                              borderRadius: BorderRadius.circular(13),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                              badgeColor: Colors.yellow[600],
                              elevation: 0,
                              badgeContent: Text(
                                'Driver',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
          ),
        ],
      ),
    );
  }
}
