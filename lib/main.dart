import 'package:flutter/material.dart';
import 'package:flutter_app_messager/screens/enregistement_ecran.dart';
import 'package:flutter_app_messager/screens/login_screen.dart';
import 'package:flutter_app_messager/screens/tchat_ecran.dart';

import 'screens/bienvenue_ecran.dart';

void main() => runApp(FlashChat());

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
