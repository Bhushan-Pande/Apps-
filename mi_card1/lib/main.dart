import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
      body:SafeArea(
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(
                  'images/bhushan_image.jpg',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Bhushan Pande',
                  textAlign:TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily:'Bangers',
                    backgroundColor: Colors.white,
                    letterSpacing: 4,
                  ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
              'ML/DL/DS/AI/DEVELOPER',
                textAlign:TextAlign.center,
                style: TextStyle(
                fontSize: 20,
                fontFamily:'Permanent',
                color: Colors.white,
            ),

              ),
              SizedBox(
                height: 15,
                child:Divider(
                  height: 5,
                  color:Colors.white,
                  indent: 50,
                  endIndent: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical:10.0,horizontal:25),
                child: Card(
                  child:Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                      ),
                      Text(
                        '9359041286',
                        textDirection:TextDirection.rtl,
                        textScaleFactor:1,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily:'Patrick',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical:10.0,horizontal:25),
                child: Card(
                  child:Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                      ),
                      Text(
                          'bhushanpande06@gmail.com'.toLowerCase(),
                        textDirection:TextDirection.rtl,
                        textScaleFactor:1,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily:'Patrick',
                          color: Colors.black,
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      );

  }
}

