// @dart=2.9
import 'dart:async';

import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/loading.dart';
import 'package:crown_city_car_hire/screens/customer/pages/payments/payments_view1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core.dart';

class BookCarView extends GetView<BookCarController> {
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
                buildBody(),
                Container(
                  height: 90,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.condition == 'Daily'
                                ? controller.number + ' Day' + "(s)"
                                : car.condition == 'Weekly'
                                    ? controller.number + ' Week' + "(s)"
                                    : controller.number + ' Month' + "(s)",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                controller.price.value == ''
                                    ? car.price + ' USD'
                                    : controller.price.value + ' USD',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Total amount',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addBookingDetails(car);
                          Get.to(() => PaymentsView(),
                              binding: PaymentsBinding(), arguments: car);
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
                                'Select This Car',
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
              "SPECIFICATIONS",
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
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                _buildSpecificationCAr('Color', 'White'),
                _buildSpecificationCAr('GearBox', 'Automatic'),
                _buildSpecificationCAr('Seat', '4'),
                _buildSpecificationCAr('Motor', 'v10 2.0'),
                _buildSpecificationCAr('Speed (0-100)', '3.2 sec'),
                _buildSpecificationCAr('Top Speed', '120 mph'),
              ],
            ),
          )
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
              controller.isloading.value
                  ? Loading(
                      text: Text(
                        'Updating total amount...',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.white),
                      ),
                    )
                  : Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < 30; i++)
                                _buildPricePerPeriod(
                                    '${i + 1}',
                                    '${double.parse(car.price) * (i + 1)}',
                                    controller.index.value == i.toString()
                                        ? true
                                        : controller.index.value == '' && i == 0
                                            ? true
                                            : controller.index.value !=
                                                    i.toString()
                                                ? false
                                                : false,
                                    i)
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          )),
    );
  }

  Widget _buildPricePerPeriod(
      String number, String price, bool selected, int index) {
    return GestureDetector(
      onTap: () {
        controller.isloading.value = true;
        controller.index.value = index.toString();

        Timer(Duration(milliseconds: 250), () {
          controller.number.value = number;
          controller.price.value = price;
          controller.isloading.value = false;
        });
      },
      child: Container(
        height: 130,
        width: 100,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: selected ? KPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.grey[300],
            width: selected ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              car.condition == 'Daily'
                  ? number + " " + 'Day' + "(s)"
                  : car.condition == 'Weekly'
                      ? number + " " + 'Week' + "(s)"
                      : number + " " + 'Month' + "(s)",
              style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(child: Container()),
            Text(
              price,
              style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "USD",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      actions: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: KPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Icon(Icons.bookmark_border, color: Colors.white, size: 23),
        ),
        SizedBox(
          width: 13,
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300], width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Icon(Icons.ios_share, color: Colors.black, size: 23),
        )
      ],
    );
  }
}
