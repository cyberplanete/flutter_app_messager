import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BulleMesssage extends StatelessWidget {
  final String texteMessage;
  final String emailExpediteur;
  final bool isMessageFromUtilisateurConnecte;

  BulleMesssage(
      {this.texteMessage,
      this.emailExpediteur,
      this.isMessageFromUtilisateurConnecte});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //j'ajoute un padding entre chaque BulleMesssage
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMessageFromUtilisateurConnecte
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            '$emailExpediteur',
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          Material(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            //J'ajoute une ombre
            elevation: 5,
            color: isMessageFromUtilisateurConnecte
                ? Colors.lightBlueAccent
                : Colors.white,
            //j'ajoute un padding intérieur entre le texte et l'extrémite de Material
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                '$texteMessage',
                style: TextStyle(
                    fontSize: 12,
                    color: isMessageFromUtilisateurConnecte
                        ? Colors.white
                        : Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
