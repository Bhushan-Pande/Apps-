import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'registrationscreen.dart';
import 'signinscreen.dart';
import 'chatscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(chat_start());
}

class chat_start extends StatelessWidget {
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
