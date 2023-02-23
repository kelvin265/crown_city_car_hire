// @dart=2.9
import 'dart:io';
import 'package:crown_city_car_hire/constants/loading.dart';
import 'package:crown_city_car_hire/screens/customer/core.dart';
import 'package:crown_city_car_hire/screens/customer/shared/widgets/app_bar_widget.dart';
import 'package:crown_city_car_hire/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditprofileView extends GetView<EditProfileController> {
  const EditprofileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    Widget show() {
      return controller.selectedImagePath.value == '' &&
              controller.customerController.customer.image == ''
          ? Stack(
              fit: StackFit.loose,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/users/faisal-ramdan.jpg'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 90.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => controller.getImage(ImageSource.gallery),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25.0,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : controller.selectedImagePath.value != ''
              ? Stack(
                  fit: StackFit.loose,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              image: DecorationImage(
                                  image: FileImage(
                                      File(controller.selectedImagePath.value)),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 90.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                controller.getImage(ImageSource.gallery),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 25.0,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              : controller.customerController.customer.image != ''
                  ? Stack(
                      fit: StackFit.loose,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .customerController.customer.image),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 90.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    controller.getImage(ImageSource.gallery),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  : Container();
    }

    return Obx(
      () => controller.isLoading.value == true
          ? Loading()
          : Scaffold(
              body: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    AppBarWidget(
                      title: "Edit Profile",
                    ),
                    Column(
                      children: [
                        Container(
                          height: 200,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: show(),
                              )
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            color: Color(0xffFFFFFF),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Personal information',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                            child: TextFormField(
                                          initialValue: controller
                                              .customerController.customer.name,
                                          decoration: InputDecoration(
                                              hintText: 'Enter full name'),
                                          validator: (val) => val.isEmpty
                                              ? 'name is required'
                                              : null,
                                          onSaved: (val) =>
                                              controller.customer.name = val,
                                        ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Email',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                            child: TextFormField(
                                          initialValue: controller
                                              .customerController
                                              .customer
                                              .email,
                                          decoration: InputDecoration(
                                              hintText: 'Enter email address'),
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
                                          onSaved: (val) =>
                                              controller.customer.email = val,
                                        ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Phone Number',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                            child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          initialValue: controller
                                              .customerController
                                              .customer
                                              .number,
                                          decoration: InputDecoration(
                                              hintText: 'Enter phone number'),
                                          validator: (val) => val.isEmpty
                                              ? 'phone number is required'
                                              : null,
                                          onSaved: (val) =>
                                              controller.customer.number = val,
                                        ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Gender',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                            child: TextFormField(
                                          initialValue: controller
                                              .customerController
                                              .customer
                                              .gender,
                                          decoration: InputDecoration(
                                              hintText: 'Enter gender'),
                                          validator: (val) => val.isEmpty
                                              ? 'Enter gender'
                                              : null,
                                          onSaved: (val) =>
                                              controller.customer.gender = val,
                                        ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Birthday',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                            child: TextFormField(
                                          initialValue: controller
                                              .customerController
                                              .customer
                                              .birthday,
                                          decoration: InputDecoration(
                                              hintText: 'Choose birthday'),
                                          validator: (val) => val.isEmpty
                                              ? 'Enter birthday'
                                              : null,
                                          onSaved: (val) => controller
                                              .customer.birthday = val,
                                        ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 45.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.0),
                                            child: Container(
                                              child: RaisedButton(
                                                child: Text('Save'),
                                                textColor: Colors.white,
                                                color: Colors.green,
                                                onPressed: () async {
                                                  _formKey.currentState.save();
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    controller
                                                            .customer.balance =
                                                        controller
                                                            .customerController
                                                            .customer
                                                            .balance;
                                                    controller
                                                            .customer.location =
                                                        controller
                                                            .customerController
                                                            .customer
                                                            .location;
                                                    controller.customer.id =
                                                        controller
                                                            .customerController
                                                            .customer
                                                            .id;
                                                    controller.customer.type =
                                                        controller
                                                            .customerController
                                                            .customer
                                                            .type;
                                                    controller.customer.image =
                                                        controller
                                                            .customerController
                                                            .customer
                                                            .image;

                                                    controller.customer
                                                            .lastMessageTime =
                                                        controller
                                                            .customerController
                                                            .customer
                                                            .lastMessageTime;

                                                    controller.isLoading.value =
                                                        true;
                                                    if (controller
                                                            .selectedImagePath
                                                            .value !=
                                                        '') {
                                                      await Database()
                                                          .updateCustomerDetails(
                                                              controller
                                                                  .customer,
                                                              controller
                                                                  .onCustomerUploaded,
                                                              localFile: File(
                                                                  controller
                                                                      .selectedImagePath
                                                                      .value));
                                                    } else {
                                                      await Database()
                                                          .updateCustomerDetails(
                                                        controller.customer,
                                                        controller
                                                            .onCustomerUploaded,
                                                      );
                                                    }

                                                    controller.isLoading.value =
                                                        false;
                                                  }
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: RaisedButton(
                                              child: Text('Cancel'),
                                              textColor: Colors.white,
                                              color: Colors.red,
                                              onPressed: () => Get.back(),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ),
                                          flex: 2,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
