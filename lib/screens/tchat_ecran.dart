import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final authFirebaseInstance = FirebaseAuth.instance;
  final firestoreData = FirebaseFirestore.instance;
  User firebaseUser;
  String texteDuMessage;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

//Obtenir l'utilisateur connecté
  void getCurrentUser() {
    try {
      final utilisateur = authFirebaseInstance.currentUser;
      if (utilisateur != null) {
        firebaseUser = utilisateur;
        print(utilisateur);
      }
    } catch (e) {
      print(e);
    }
  }

  //Obtenir les messages stockés
  // void getMessages() async {
  //   final messages = await firestoreData.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  void messagesStream() async {
    //For sur la collection de messages
    await for (var snapshot
        in firestoreData.collection('messages').snapshots()) {
      //je recupère le texte et email pour chaque message
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                authFirebaseInstance.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️TChat Messager'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        texteDuMessage = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Insertion dans la base
                      firestoreData.collection('messages').add({
                        //Correspond aux champs configurés dans Firestore
                        'texte': texteDuMessage,
                        'expediteur': firebaseUser.email
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Envoyer',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
