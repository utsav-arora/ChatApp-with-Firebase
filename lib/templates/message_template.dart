import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageTemplate extends StatelessWidget {

  bool isMe;
  String text;
  String provider;
  Timestamp ts;

  MessageTemplate({required this.provider , required this.text , required this.isMe , required this.ts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('$provider}',
          style:const TextStyle(
            color: Colors.black54,
            fontSize: 12.0
          ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe ? const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)
            ) : const BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)
            ),
            color: isMe ? Colors.blueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Text(text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
                fontSize: 15.0,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ${DateTime.fromMillisecondsSinceEpoch(ts.seconds * 1000)