import 'package:crown_city_car_hire/models/customer.dart';
import 'package:crown_city_car_hire/screens/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<CustomerModel> users;
  const ChatBodyWidget({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: buildChats(),
      ),
    );
  }

  Widget buildChats() => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = users[index];

          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                Get.to(() => ChatPage(
                      user: user,
                    ));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user.image),
              ),
              title: Text(user.name),
            ),
          );
        },
        itemCount: users.length,
      );
}
