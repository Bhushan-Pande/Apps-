import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:witchat/homescreen.dart';


class registrationscreen extends StatefulWidget {
  @override
  static const id='registrationscreen';
  _registrationscreenState createState() => _registrationscreenState();
}

class _registrationscreenState extends State<registrationscreen> {
  @override
  String email;
  String password;
  static const id='registrationscreen';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(tag:'leaf',child: Image(image: AssetImage('Assets/leaf.png'),width:50,color:Color(0xFFD3C0C5),)),
                Container(
                  child:
                  Text(
                    'Registration',textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD7C083),
                      letterSpacing: 2,
                      fontSize:42,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20),color:Colors.white,
              ),
              child: TextField(
                textAlign:TextAlign.center,
                style: TextStyle(
                  color:Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
                ),
                keyboardType:TextInputType.emailAddress,
                onChanged: (value)
                {
                  email=value;
                  print(email);
                },
              ),
            ),
            SizedBox(
              height:20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20),color:Colors.white,
              ),
              child: TextField(
                textAlign:TextAlign.center,
                style: TextStyle(
                  color:Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
                ),
                keyboardType:TextInputType.emailAddress,
                onChanged: (value)
                {
                  email=value;
                  print(email);
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              width: 40,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)
                  ),
                  color:Color(0xFFDCE0F4),
                  child: Text(
                    'Register',textAlign:TextAlign.center,style: TextStyle(
                    fontSize:22,letterSpacing: 1.5,
                  ),
                  ),
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context,homescreen.id);
                    });
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

