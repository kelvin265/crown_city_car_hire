// @dart=2.9
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Widget text;
  Loading({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            children: [
              SpinKitFadingCircle(
                color: KPrimaryColor,
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SpinKitPulse(
                  color: KPrimaryColor,
                  size: 40,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          text != null ? text : Container()
        ]),
      ),
    );
  }
}
