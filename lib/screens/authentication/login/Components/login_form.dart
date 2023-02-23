import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/constants/loading.dart';
import 'package:crown_city_car_hire/controllers/authController.dart';
import 'package:crown_city_car_hire/screens/authentication/Components/input_container.dart';
import 'package:crown_city_car_hire/screens/customer/pages/xcore.dart';
import 'package:crown_city_car_hire/screens/drivers/driver_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool validate() {
    final form = _formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading(
            text: Text(
              'loading...',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white),
            ),
          )
        : AnimatedOpacity(
            opacity: widget.isLogin ? 1.0 : 0.0,
            duration: widget.animationDuration * 4,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: widget.size.width,
                  height: widget.defaultLoginSize,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 20),
                        Image(
                            image:
                                AssetImage('assets/crown_city_car_hire.png')),
                        SizedBox(height: 20),
                        InputContainer(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: KPrimaryColor,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(
                                      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.mail, color: KPrimaryColor),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                            controller: emailController,
                          ),
                        ),
                        InputContainer(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            cursorColor: KPrimaryColor,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 5 || value.length > 20) {
                                return 'Password must be between 5 and 20 characters';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock, color: KPrimaryColor),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                            controller: passwordController,
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () async {
                            if (validate()) {
                              setState(() => loading = true);
                              bool result = await _authController.login(
                                  emailController.text,
                                  passwordController.text);
                              if (!result) {
                                setState(() => loading = false);
                              } else {
                                setState(() => loading = false);
                                customerController.customer.type == 'customer'
                                    ? Get.offAll(() => MainView())
                                    : Get.offAll(() => DriverHomeView());
                              }
                            }
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: KPrimaryColor,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.center,
                            child: Text(
                              'SIGN IN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
