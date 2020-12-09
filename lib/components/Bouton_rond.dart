import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoutonRondWidget extends StatelessWidget {
  final String titleTextButton;
  final Color colorButton;
  final Function functionOnPressed;
  const BoutonRondWidget(
      {this.titleTextButton,
      this.colorButton,
      @required this.functionOnPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colorButton,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: functionOnPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            titleTextButton,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
