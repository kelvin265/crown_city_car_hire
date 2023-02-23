import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:crown_city_car_hire/screens/chat/widgets/chat_header_widget.dart';
import 'package:crown_city_car_hire/screens/customer/core.dart';
import 'package:crown_city_car_hire/services/database.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_body_widget.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: SafeArea(
        child: StreamBuilder<List<CustomerModel>>(
          stream: Database().getChatUsers(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return buildText('something went wrong');
                } else {
                  final users = snapshot.data;
                  if (users.isEmpty) {
                    return buildText('No users found');
                  } else {
                    return Column(children: [
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customerController.customer.type == 'driver'
                              ? AppBarWidget()
                              : Container(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Text(
                              'Chat Forum',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ChatHeaderWidget(users: users),
                      ChatBodyWidget(users: users)
                    ]);
                  }
                }
            }
          },
        ),
      ),
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
