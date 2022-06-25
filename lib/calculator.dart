import 'package:flutter/material.dart';
import './main.dart';
import './splash.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";

  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String history = "";

  buttonPressed(String btnVal) {
    print(btnVal);
    if (btnVal == "C") {
      _out = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      history = "";
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/") {
      num1 = double.parse(output);
      operand = btnVal;
      _out = "0";
      output = output + btnVal;
    } else if (btnVal == ".") {
      if (_out.contains(".")) {
        print("Already exist");
        return;
      } else {
        _out = _out + btnVal;
      }
    } else if (btnVal == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num2 + num1).toString();
        history = (num2).toString() + (num1).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }
      if (operand == "*") {
        _out = (num2 * num1).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      //_out = "0";
    } else {
      _out = _out + btnVal;
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
      history = double.parse(_out).toStringAsFixed(2);
    });
  }

  Widget numButton(String btntxt, Color btncolor, Color txtcolor) {
    print(btntxt);
    return ElevatedButton(
      onPressed: () => buttonPressed(btntxt),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(70, 70), shape: CircleBorder(), primary: btncolor),
      child: Text(
        btntxt,
        style: TextStyle(fontSize: 25.0, color: txtcolor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calculator",
          style: TextStyle(fontSize: 30.0),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    output,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 58.0),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey, Colors.black),
                numButton("+/-", Colors.grey, Colors.black),
                numButton("%", Colors.grey, Colors.black),
                numButton("/", Colors.orange, Colors.black)
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", Colors.grey, Colors.black),
                numButton("8", Colors.grey, Colors.black),
                numButton("9", Colors.grey, Colors.black),
                numButton("*", Colors.orange, Colors.black)
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", Colors.grey, Colors.black),
                numButton("5", Colors.grey, Colors.black),
                numButton("6", Colors.grey, Colors.black),
                numButton("-", Colors.orange, Colors.black)
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", Colors.grey, Colors.black),
                numButton("2", Colors.grey, Colors.black),
                numButton("3", Colors.grey, Colors.black),
                numButton("+", Colors.orange, Colors.black)
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), primary: (Colors.grey)),
                    onPressed: () => buttonPressed("0"),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(28, 12, 90, 13),
                      child: Text("0",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.black, fontSize: 25.0)),
                    )),
                numButton(".", Colors.grey, Colors.white),
                numButton("=", Colors.orange, Colors.white)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
