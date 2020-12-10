import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_messager/components/Bouton_rond.dart';
import 'package:flutter_app_messager/constants.dart';
import 'package:flutter_app_messager/screens/tchat_ecran.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final authFirebaseInstance = FirebaseAuth.instance;
  String utilisateur;
  String password;
  bool montrerSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Spinner désactiver
      body: ModalProgressHUD(
        inAsyncCall: montrerSpinner,
        child: Padding(
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
                  functionOnPressed: () async {
                    print(utilisateur);
                    print(password); //Spinner affiché
                    setState(() {
                      montrerSpinner = true;
                    });

                    try {
                      final nouvelUtilisateur = await authFirebaseInstance
                          .createUserWithEmailAndPassword(
                              email: utilisateur, password: password);
                      if (nouvelUtilisateur != null) {
                        //Spinner desactiver lorsque utilisateur est crée
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        montrerSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
