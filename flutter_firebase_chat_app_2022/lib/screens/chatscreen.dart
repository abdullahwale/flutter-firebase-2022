import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chats/IoR4uT3o7Bb2s9SmErJt/message')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = snapshot.data!.docs;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (cont, index) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    child: Text(documents[index]['text']),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_rounded),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/IoR4uT3o7Bb2s9SmErJt/message')
              .add({'text': "COMSATS"});
        },
      ),
    );
  }
}

// FirebaseFirestore.instance
//     .collection('chats/IoR4uT3o7Bb2s9SmErJt/message')
//     .snapshots()
//     .listen((event) {
//   event.docs.forEach((element) {
//     print(element['text']);
//   });
//   //print(event.docs[0]['text']);
// });
