// @dart=2.9
import 'package:badges/badges.dart';
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/screens/customer/pages/booking/myBookings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../core.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bookingController.getMyBookings(bookingController.bookings);
    controller.displayCar = controller.cars[0];
    controller.getmyBookedCar(bookingController.myBookings);
    controller.removeBookedCar(controller.cars);
    return Obx(
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
                    buildAvilableCars(),
                    buildTopDeals(),
                    buildTopDealers()
                  ],
                )),
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
                'TOP DEALERS',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                    fontSize: 22),
              ),
              Row(
                children: [
                  Text(
                    'More',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: KPrimaryColor,
                        fontSize: 14),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: KPrimaryColor,
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: 160,
          margin: EdgeInsets.only(bottom: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: controller.dealers
                .map((dealer) =>
                    buildDealer(dealer, controller.dealers.indexOf(dealer)))
                .toList(),
          ),
        )
      ],
    );
  }

  Column buildTopDeals() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOP DEALS',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                    fontSize: 22),
              ),
              Row(
                children: [
                  Text(
                    'More',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: KPrimaryColor,
                        fontSize: 14),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: KPrimaryColor,
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: 280,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: controller.carsAvailable
                .map((car) => GestureDetector(
                      onTap: () => Get.toNamed(Routes.BOOK_CAR, arguments: car),
                      child: buildCar(car, controller.cars.indexOf(car)),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget buildAvilableCars() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.AVAILABLE_CARS),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 16, left: 16),
        child: Container(
          decoration: BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          padding: EdgeInsets.all(24),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Available Cars",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  Text("Long term and short term",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ],
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: KPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Column(
        children: [
          _buildScreenHeader(),
          SizedBox(
            height: 30,
          ),
          CarImagesWidget(
            images: controller.displayCar.images.cast<String>().toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CarNameWidget(
                    model: controller.displayCar.model,
                    brand: controller.displayCar.brand),
                GestureDetector(
                  onTap: () {
                    bookingController.getMyBookings(bookingController.bookings);
                    Get.to(() => MyBookings());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(children: [
                      Text(
                        'My Garage',
                        style: TextStyle(
                            fontSize: 17,
                            color: KPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 23,
                        color: KPrimaryColor,
                      )
                    ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildScreenHeader() {
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
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          badgeColor: Colors.yellow[600],
                          elevation: 0,
                          badgeContent: Text(
                            'Customer',
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                                'Gold',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Text(
                        'Payments',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => {paymentsController.getPaymentHistory()},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: KPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
