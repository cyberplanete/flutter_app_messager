import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_messager/components/Bouton_rond.dart';
import 'package:flutter_app_messager/constants.dart';
import 'package:flutter_app_messager/screens/tchat_ecran.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String utilisateur;
  String password;
  final authFirebaseInstance = FirebaseAuth.instance;
  bool montrerSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Spinner désactiver lors du chargement de la page
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
                    password = value;
                  },
                  decoration: kInputTextDecoration.copyWith(
                      hintText: 'Entrez votre mot de passe.')),
              SizedBox(
                height: 24.0,
              ),
              BoutonRondWidget(
                titleTextButton: 'Se connecter',
                functionOnPressed: () async {
                  setState(() {
                    montrerSpinner = true;
                  });

                  try {
                    final UtilisateurEnregistre =
                        await authFirebaseInstance.signInWithEmailAndPassword(
                            email: utilisateur, password: password);
                    if (UtilisateurEnregistre != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      montrerSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                colorButton: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
