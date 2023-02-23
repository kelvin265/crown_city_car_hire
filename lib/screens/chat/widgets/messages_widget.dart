import 'package:crown_city_car_hire/constants/controllers.dart';
import 'package:crown_city_car_hire/models/message.dart';
import 'package:crown_city_car_hire/screens/chat/widgets/message_widget.dart';
import 'package:crown_city_car_hire/services/database.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  final String idUser;
  const MessagesWidget({Key key, this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream: Database().getMessages(idUser),
        builder: (context, snapshot) {
          final messages = snapshot.data;
          return messages.isEmpty
              ? buildText('Say Hello')
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final message = messages[index];

                    return MessageWidget(
                      message: message,
                      isMe: message.idUser == customerController.customer.id,
                    );
                  },
                  itemCount: messages.length ?? 0,
                  reverse: true);
        });
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
