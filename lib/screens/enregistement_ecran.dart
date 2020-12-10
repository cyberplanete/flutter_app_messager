import 'package:flutter/material.dart';
import 'package:flutter_app_messager/components/Bouton_rond.dart';
import 'package:flutter_app_messager/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String utilisateur;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Animation
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  utilisateur = value;
                },
                decoration: kInputTextDecoration.copyWith(
                    hintText: 'Entrez votre adresse email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kInputTextDecoration.copyWith(
                  hintText: 'Entrez votre mot de passe.'),
            ),
            SizedBox(
              height: 24.0,
            ),
            new BoutonRondWidget(
                titleTextButton: 'S\'enregistrer',
                colorButton: Colors.blueAccent,
                functionOnPressed: () {
                  print(utilisateur);
                  print(password);
                }),
          ],
        ),
      ),
    );
  }
}
