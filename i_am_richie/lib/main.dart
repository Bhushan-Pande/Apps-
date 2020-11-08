import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child:Container(
          child: Center(
            child: Text("Good morning",),
          ),
          margin: EdgeInsets.all(50.0),
          padding: EdgeInsets.symmetric(),
          height: 800,
          width: 800,

        ),

      ),
        backgroundColor: Colors.blueAccent,
    )
    );
  }
}






