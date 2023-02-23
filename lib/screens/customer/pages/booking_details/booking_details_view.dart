import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/models/booking.dart';
import 'package:crown_city_car_hire/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core.dart';

class BookingDetailsView extends GetView<BookingDetailsController> {
  final booking = Get.arguments as BookingModel;
  Car car;
  selectCar() {
    int count = carController.cars.length;
    for (var i = 0; i < count; i++) {
      if (carController.cars[i].id == booking.carId) {
        car = carController.cars[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    selectCar();
    return Scaffold(
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
                height: 80,
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
                          'Total Paid',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
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
                              'Made Payments',
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
              "BOOKING DETAILS",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400]),
            ),
          ),
          Container(
            height: 240,
            padding: EdgeInsets.only(
              top: 10,
              left: 16,
            ),
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBookingInfo(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Driver',
                      weight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                    _buildSpecificationCAr('Rate', '...'),
                    _buildSpecificationCAr('Chat', '...'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBookingInfo() {
    return Container(
      width: 240,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date :',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            booking.date,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1),
          Text(
            'Days :',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            booking.dateRange.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1),
          Text(
            'Driver Option :',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            booking.driverOption.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1),
          Text(
            'Total Cost :',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            "\$" + booking.cost.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1),
          Text(
            'Expirely Date :',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            booking.date,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1),
          Text(
            'Booking Status :',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          Text(
            booking.status.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildSpecificationCAr(String title, String data) {
    return Container(
      width: 70,
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
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      actions: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Icon(Icons.cancel, color: Colors.white, size: 23),
        ),
      ],
    );
  }
}
