import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/models/customer.dart';
import 'package:crown_city_car_hire/screens/customer/shared/xcore.dart';
import 'package:flutter/material.dart';

import 'widgets/messages_widget.dart';
import 'widgets/new_message_widget.dart';

class ChatPage extends StatefulWidget {
  final CustomerModel user;
  const ChatPage({Key key, this.user}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: KPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBarWidget(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Text(
                    widget.user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: MessagesWidget(idUser: widget.user.id),
              ),
            ),
            NewMessageWidget(
              idUser: widget.user.id,
            )
          ],
        ),
      ),
    );
  }
}
