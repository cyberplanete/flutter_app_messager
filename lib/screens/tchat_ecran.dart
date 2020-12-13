import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_messager/components/BulleMessage.dart';

import '../constants.dart';

final firestoreData = FirebaseFirestore.instance;
User utilisateurConnecte;

class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final authFirebaseInstance = FirebaseAuth.instance;

  String texteDuMessage;
  final messageTextController = new TextEditingController();

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
        utilisateurConnecte = utilisateur;
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
    //For sur la collection de messages - Subcription sur la collection messages
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
            //Liste des messages
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      //Permet de reinitialiser la zone de texte et utiliser lors de onPressed
                      controller: messageTextController,
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
                        'expediteur': utilisateurConnecte.email,
                        'timeStamp': Timestamp.now(),
                      });
                      //Permet de reinitialiser la zone de texte
                      messageTextController.clear();
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

//Obtenir la liste des messages
class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreData
          .collection('messages')
          .orderBy('timeStamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        //Je montre un spinner si snapshot n'a pas de donnée
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ));
        }
        //Get messages dans un ordre inversé. Le plus recent en bas
        final messages = snapshot.data.docs.reversed;
        // ignore: missing_return
        //List de Text widgets
        List<BulleMesssage> messagesBubbles = [];
        for (var message in messages) {
          final messageText = message.get('texte');
          final expediteurEmail = message.get('expediteur');

          final messageBubble = BulleMesssage(
            texteMessage: messageText,
            emailExpediteur: expediteurEmail,
            isMessageFromUtilisateurConnecte:
                utilisateurConnecte.email == expediteurEmail,
          );

          messagesBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            //Permet de fixer la vue en bas de la fe
            reverse: true,
            //j'ajoute un espace horizontal et vertical entre les messagesBubbles et l'extremite de la listeView
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messagesBubbles,
          ),
        );
      },
    );
  }
}
