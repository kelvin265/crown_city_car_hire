import 'package:crown_city_car_hire/constants/constants.dart';
import 'package:crown_city_car_hire/services/database.dart';
import 'package:flutter/material.dart';

class NewMessageWidget extends StatefulWidget {
  final String idUser;
  const NewMessageWidget({Key key, this.idUser}) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';

  sendMessage() async {
    FocusScope.of(context).unfocus();
    _controller.clear();
    await Database().uploadMessage(widget.idUser, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                labelText: 'Type your message',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: (value) => setState(() {
                message = value;
              }),
            ),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: message.trim().isEmpty ? null : sendMessage,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: KPrimaryColor),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
