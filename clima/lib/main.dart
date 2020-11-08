import 'package:clima/firstscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(ClimaApp());
}

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primaryColor: Color(0xFF1E3537),
        scaffoldBackgroundColor:Color(0xFF1E3537),
      ),
      home:firstscreen()
      );
  }
}


//Color(0xFF1E3537)

//Color(0xFF1E3537)

