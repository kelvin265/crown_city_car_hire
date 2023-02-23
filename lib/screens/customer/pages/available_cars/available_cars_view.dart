// @dart=2.9
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:line_icons/line_icons.dart';

import '../../core.dart';

class AvailableCarsView extends GetView<AvailableCarsController> {
  const AvailableCarsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.removeBookedCar();
    final filter = FilterService().getFilterList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                AppBarWidget(
                  title: "Available Cars (" +
                      controller.carsAvailable.length.toString() +
                      ")",
                ),
                SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      childAspectRatio: 1 / 1.6,
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      children: controller.carsAvailable
                          .map((car) => GestureDetector(
                                onTap: () => Get.toNamed(Routes.BOOK_CAR,
                                    arguments: car),
                                child: buildCar(car),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                color: KPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Icon(
                LineIcons.filter,
                color: Colors.white,
                size: 24,
              ),
            ),
            ValueBuilder<Filter>(
                initialValue: filter[0],
                builder: (value, updateFn) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: filter
                          .map((filter) => GestureDetector(
                                onTap: () => updateFn(filter),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: Text(
                                    filter.name,
                                    style: TextStyle(
                                      color: value.name == filter.name
                                          ? KPrimaryColor
                                          : Colors.grey[500],
                                      fontSize: 16,
                                      fontWeight: value.name == filter.name
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ))
          ],
        ),
      ),
    );
  }
}
