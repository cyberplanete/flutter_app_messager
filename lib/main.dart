import 'package:flutter/material.dart';
import 'package:flutter_app_messager/screens/chat_screen.dart';
import 'package:flutter_app_messager/screens/login_screen.dart';
import 'package:flutter_app_messager/screens/registration_screen.dart';

import 'screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen()
        });
  }
}
