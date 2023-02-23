// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildMenuItem(String image, String name) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    width: 140,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          height: 60,
          width: 60,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          name,
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "tap",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    ),
  );
}
