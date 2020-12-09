import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_messager/components/Bouton_rond.dart';
import 'package:flutter_app_messager/screens/login_screen.dart';
import 'package:flutter_app_messager/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    //Cette classe herite de SingleTickerProviderStateMixin. WelcomeScreen devient un provider. this object
    animationController = AnimationController(
        // duration: Duration(seconds: 5), vsync: this, upperBound: 100);
        duration: Duration(seconds: 1),
        vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      //Pour animation
      setState(() {});
      print(animationController.value);
      print(animation.value);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Exemple animation
      //value from animation mais nécessite setState
      //backgroundColor: Colors.red.withOpacity(animationController.value),
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    //Exemple animation
                    // height: animationController.value,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Tchat'],

                  //'Flash Tchat',
                  //Exemple Animation
                  //Loader necessite upperbound
                  //'${animationController.value.toInt()}%',
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            BoutonRondWidget(
              functionOnPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
              colorButton: Colors.lightBlue,
              titleTextButton: 'Se connecter',
            ),
            BoutonRondWidget(
              functionOnPressed: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              titleTextButton: 'S\'enregistrer',
              colorButton: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}

// () {
// //Go to login screen.
// Navigator.pushNamed(context, LoginScreen.id);
// },
