import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  @override
  String display = '';
  double? firstNum;
  String? operator;

  void expression(String value) {
    setState(() {
      if (value == '+' || value == '-' || value == '*' || value == '/') {
        firstNum = double.parse(display);
        operator = value;
        display = '';

      } else if (value == '=') {
        double? secondNum = double.parse(display);
        if (firstNum != null && operator != null && secondNum != null) {
          switch (operator) {
            case '+':
              display = (firstNum! + secondNum).toString();
              break;
            case '-':
              display = (firstNum! - secondNum).toString();
              break;
            case '*':
              display = (firstNum! * secondNum).toString();
              break;
            case '/':
              display = (firstNum! / secondNum).toString();
              break;
          }
        }
        firstNum = null;
        operator = null;

      } else if (value == 'C') {
        display = '';
        firstNum = null;
        operator = null;

      } else {
        display += value;
      }
    });
  }

  Widget buildButton(String value) {
    return Expanded(
      child: InkWell(
        onTap: () => expression(value),
        child: Container(
          height: 80,
          margin: EdgeInsets.all(1),
          color: Colors.grey,
          child: Center(
            child: Text(
              value,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child: Text(
              display,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ]),
                Row(children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                ]),
                Row(children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ]),
                Row(children: [
                  buildButton('C'),
                  buildButton('0'),
                  buildButton('='),
                  buildButton('+'),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}