import 'package:flutter/material.dart';
import 'package:flutter_app_messager/components/Bouton_rond.dart';
import 'package:flutter_app_messager/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                //Do something with the user input.
              },
              decoration: kInputTextDecoration.copyWith(
                hintText: 'Entrez votre adresse email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kInputTextDecoration.copyWith(
                    hintText: 'Entrez votre mot de passe.')),
            SizedBox(
              height: 24.0,
            ),
            BoutonRondWidget(
              titleTextButton: 'Se connecter',
              functionOnPressed: () {},
              colorButton: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
