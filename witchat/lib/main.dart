import 'package:flutter/material.dart';
import 'package:witchat/homescreen.dart';
import 'package:witchat/registrationscreen.dart';
import 'package:witchat/signinscreen.dart';
import 'chatscreen.dart';

void main() {
  runApp(witchat());
}

class witchat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:Color(0xFF2E3A44),
      ),
      initialRoute:homescreen.id,
      routes: {
        homescreen.id: (context) => homescreen(),
        registrationscreen.id: (context) => registrationscreen(),
        signinscreen.id: (context) => signinscreen(),
        chatscreen.id: (context) => chatscreen(),
      },
    );
  }
}
