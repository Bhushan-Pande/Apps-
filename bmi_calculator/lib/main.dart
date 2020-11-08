import 'package:flutter/material.dart';
import 'InputPage.dart';

void main()
{
  runApp(BmiCalculator());
}

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primaryColor: Color(0xFF18141F),
        scaffoldBackgroundColor: Color(0xFF0C1225),
      ),
      home:InputPage(),
    );
  }
}

