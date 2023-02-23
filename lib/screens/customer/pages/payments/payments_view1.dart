import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/constants/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core.dart';

class PaymentsView extends GetView<PaymentsController> {
  final car = Get.arguments as Car;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(),
                controller.isLoading.value ? Loading() : buildBody(),
                Container(
                  height: 90,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.gotDriver.value == false) {
                            bookingController.currentBooking.driverOption =
                                'No';
                            bookingController.currentBooking.status =
                                'On-going';
                          } else {
                            bookingController.currentBooking.driverOption =
                                'Yes';
                            bookingController.currentBooking.status =
                                'On-going';
                          }
                          bookingController.addCarToBooking(
                            bookingController.currentBooking,
                            car: car,
                          );
                          Get.offAll(() => MainView());
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: KPrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Cash Payment',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.checkout(car: car);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: KPrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Pay Online',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Text(
              "DRIVER OPTION",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400]),
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.only(
              top: 10,
              left: 16,
            ),
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSpecificationCAr(
                    'Driver Cost', '${controller.driverCost.value}'),
                GestureDetector(
                    onTap: () {
                      if (controller.gotDriver.value == false) {
                        bookingController.currentBooking.cost +=
                            controller.driverCost.value;
                        bookingController.currentBooking.driverOption = "Yes";
                      } else {
                        bookingController.currentBooking.cost -=
                            controller.driverCost.value;
                        bookingController.currentBooking.driverOption = "No";
                      }
                      controller.gotDriver.value = !controller.gotDriver.value;
                      print(controller.totalCost.value.toString());
                    },
                    child: _buildSpecificationCAr(
                        controller.gotDriver.value == false
                            ? 'Get Driver'
                            : 'Remove Driver',
                        'Click')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Text(
              "BOOKING DETAILS",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400]),
            ),
          ),
          Obx(() => Container(
                height: 80,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 16,
                ),
                margin: EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSpecificationCAr('Total Amount',
                        '${bookingController.currentBooking.cost}'),
                    _buildSpecificationCAr('Total Days',
                        '${bookingController.currentBooking.dateRange}'),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildSpecificationCAr(String title, String data) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            data,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              SizedBox(
                height: 17,
              ),
              CarNameWidget(model: car.model, brand: car.brand),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: CarImagesWidget(
                  images: car.images.cast<String>().toList(),
                  isExpanded: true,
                ),
              ),
            ],
          )),
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      title: 'COMPLETE BOOKING',
    );
  }
}
