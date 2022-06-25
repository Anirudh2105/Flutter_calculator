import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import './calculator.dart';
import './splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: AnimatedSplashScreen(
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.black,
          splash: Center(
              child: ListTile(
            title: Text(
              "CALCULATOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 4.5
                  ..color = Colors.white,
                fontSize: 55.00,
                //color: Colors.white,
                //decorationStyle: TextDecorationStyle.wavy0
              ),
            ),
            subtitle: Text(
              "By Anirudh ",
              style: TextStyle(color: Colors.amber),
              textAlign: TextAlign.right,
            ),
          )),
          nextScreen: Calculator()),
    );
  }
}
