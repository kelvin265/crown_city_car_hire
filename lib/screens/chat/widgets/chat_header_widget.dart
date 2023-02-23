import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:crown_city_car_hire/models/rate.dart';
import 'package:crown_city_car_hire/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatHeaderWidget extends StatelessWidget {
  final List<CustomerModel> users;

  const ChatHeaderWidget({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      if (customerController.customer.type == 'customer') {
                        Get.defaultDialog(
                            title: 'Rate The Driver',
                            textConfirm: 'Confirm',
                            onConfirm: () async {
                              Rate rate = new Rate();
                              rate.id = Uuid().v4();
                              rate.rate = chatController.rating.value;
                              rate.driverId = user.id;
                              if (await Database().createRate(rate)) {
                                Get.back();
                                Get.snackbar('Success',
                                    'driver ${user.name} has been rated successfully',
                                    backgroundColor: Colors.green[200],
                                    colorText: Colors.white);
                              } else {
                                Get.snackbar('failed',
                                    'driver ${user.name} has not been rated',
                                    backgroundColor: Colors.red[200],
                                    colorText: Colors.white);
                              }
                            },
                            content: Obx(() => Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Rating: ${chatController.rating.value}',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                      RatingBar.builder(
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) =>
                                            chatController.rating.value =
                                                rating,
                                        minRating: 1,
                                        updateOnDrag: true,
                                        itemSize: 30,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                      ),
                                    ],
                                  ),
                                )));
                      }
                    },
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(user.image),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
