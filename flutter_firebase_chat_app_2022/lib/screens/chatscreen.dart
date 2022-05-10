import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (cont, index) {
            return Container(
              padding: EdgeInsets.all(15),
              child: Text("Item's Created"),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_rounded),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/IoR4uT3o7Bb2s9SmErJt/message')
              .snapshots()
              .listen((event) {
            event.docs.forEach((element) {
              print(element['text']);
            });
            //print(event.docs[0]['text']);
          });
        },
      ),
    );
  }
}
