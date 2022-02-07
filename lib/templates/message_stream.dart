import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/templates/message_template.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageStream extends StatelessWidget {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;


  void getCurrentUser()  {
    try{
      final user = _auth.currentUser;
      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }

    }
    catch(e){
      print(e);
    }
  }




  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return StreamBuilder(
        stream: _firestore.collection('messages').orderBy('ts', descending: true).snapshots(),
        builder: (context , snapshot) {
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }
          var messages = (snapshot.data as QuerySnapshot).docs;
          List<MessageTemplate> messageWidgets=[];
          for(var message in messages){
            final messageText = message['text'];
            final messageSender= message['sender'];
           final messageTime = message['ts']==null ? Timestamp(2020,5) : (message['ts'] as Timestamp);
            final currentUser =loggedInUser.email;
            final messageWidget = MessageTemplate(provider: messageSender, text: messageText,
            isMe: currentUser == messageSender,
              ts: messageTime,
            );
            messageWidgets.add(messageWidget);
          }
          return  Expanded(
            child: ListView(
              reverse: true,
              children:messageWidgets,
            ),
          );
        }
    );
  }
}
