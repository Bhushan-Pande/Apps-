import 'package:clima/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class firstscreen extends StatefulWidget {
  @override
  _firstscreenState createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsplash();
    print('Start');
  }

  Future<void> getsplash() async
  {
    Duration duration;
    duration=  Duration(seconds:5);
    print(duration);
    return Timer(duration,route);
  }

   Future <void> route() async{
    return Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => LoadingScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010005),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:Container(
              child:
              SpinKitRotatingCircle(
                color: Colors.white,
                size: 200.0,
                duration: Duration(seconds: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

