import 'package:flutter/material.dart';
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
                Text(
                  'Flash Messager',
                  //Exemple Animation
                  //Loader necessite upperbound
                  //'${animationController.value.toInt()}%',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Se connecter',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'S\'enregistrer',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
