import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_messager/screens/enregistement_ecran.dart';
import 'package:flutter_app_messager/screens/login_screen.dart';
import 'package:flutter_app_messager/screens/tchat_ecran.dart';

import 'screens/bienvenue_ecran.dart';

//Initia
//void main() => runApp(FlashChat());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Firebase.initializeApp()
      .whenComplete(() => print('Initialisation Firebase Complete'));
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        /* theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),*/

        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen()
        });
  }
}
