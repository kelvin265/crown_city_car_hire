// @dart=2.9
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/screens/customer/models/car.dart';

import 'package:flutter/material.dart';

Widget buildCar(Car car, [int index]) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
                color: KBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text(
                car.condition,
                style: TextStyle(
                    color: KPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 115,
          child: Center(
            child: Hero(
              tag: car.model,
              child: Image.network(
                car.images[0],
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          car.model,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          car.brand,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        Text(
          "Per " +
              (car.condition == "Daily"
                  ? "day"
                  : car.condition == "Weekly"
                      ? "week"
                      : "month"),
          style: TextStyle(fontSize: 14, color: Colors.grey),
        )
      ],
    ),
  );
}
