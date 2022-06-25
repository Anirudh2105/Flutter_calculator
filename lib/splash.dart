import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './calculator.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Calculator()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Container(
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
          ),
        )));
  }
}
