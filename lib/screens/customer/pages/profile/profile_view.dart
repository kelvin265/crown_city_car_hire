// @dart=2.9
import 'package:badges/badges.dart';
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/controllers/authController.dart';
import 'package:crown_city_car_hire/controllers/customerController.dart';
import 'package:crown_city_car_hire/screens/map/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../core.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
          color: Colors.grey[200],
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[buildHeader(), buildBody()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.mail,
            ),
            title: Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              customerController.customer.email,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              'Phone number',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              customerController.customer.number,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          ListTile(
            leading: Icon(Icons.male),
            title: Text(
              'Gender',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              customerController.customer.gender,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text(
              'Birthday',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              customerController.customer.birthday,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          customerController.customer.type == 'customer'
              ? GestureDetector(
                  onTap: () => Get.to(MapScreen()),
                  child: ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text(
                      'location',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      customerController.customer.location != ''
                          ? customerController.customer.location
                          : 'Click here to add location!',
                      style: TextStyle(
                        color: customerController.customer.location != ''
                            ? Colors.black
                            : Colors.amber[600],
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Container buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Column(
        children: [
          _buildScreenHeader(),
        ],
      ),
    );
  }

  Container _buildScreenHeader() {
    final AuthController authController = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 90,
              child: controller.customerController.customer.image == '' &&
                      controller.customerController.customer.image == ''
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
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            badgeColor: Colors.yellow[600],
                            elevation: 0,
                            badgeContent: Text(
                              controller.customerController.customer.type,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    )
                  : controller.customerController.customer.image != ''
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
                                  backgroundImage: NetworkImage(controller
                                      .customerController.customer.image),
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
                                  controller.customerController.customer.type,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        )
                      : Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.customerController.customer.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => customerController.customer.type == 'customer'
                    ? authController.singOut()
                    : Get.back(),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Icon(
                    customerController.customer.type == 'customer'
                        ? Icons.logout_sharp
                        : Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 23,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 23,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
