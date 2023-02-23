// @dart=2.9
import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Components/cancel_button.dart';
import 'Components/login_form.dart';
import 'Components/register_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  Animation<double> containerSize;
  AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // this is used to determine if keyboard is open or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegusterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegusterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Scaffold(
      body: Stack(children: [
        //Lets add some decorations
        Positioned(
          top: 80,
          right: -50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: KPrimaryColor,
            ),
          ),
        ),

        Positioned(
          top: -50,
          left: -50,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: KPrimaryColor,
            ),
          ),
        ),

        //Cancel button
        CancelButton(
          isLogin: isLogin,
          animationDuration: animationDuration,
          size: size,
          animationController: animationController,
          tapEvent: isLogin
              ? null
              : () {
                  // returning null to disable the button
                  setState(() {
                    animationController.reverse();
                    isLogin = !isLogin;
                  });
                },
        ),
        //Login Form
        LoginForm(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            defaultLoginSize: defaultLoginSize),
        //Register Container
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            if (viewInset == 0 && isLogin) {
              return buildRegisterContainer();
            } else if (!isLogin) {
              return buildRegisterContainer();
            }
            // returning empty container to hide the widget
            return Container();
          },
        ),
        //Register Form
        RegisterForm(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            defaultLoginSize: defaultLoginSize),
      ]),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: Colors.blueGrey.withAlpha(30),
            border:
                Border.all(width: 1, color: Colors.amberAccent.withAlpha(20))),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  // returning null to disable the link
                  setState(() {
                    animationController.forward();
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    color: KPrimaryColor,
                    fontSize: 18,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
