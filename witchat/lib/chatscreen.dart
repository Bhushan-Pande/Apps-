import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatscreen extends StatefulWidget {
  @override
  static const id='chatscreen';
  _chatscreenState createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  @override
  String message;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Let\'s Chat',),
      ),
      backgroundColor: Color(0xFF303030),
      body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children:<Widget>
                    [
                      RotateAnimatedTextKit(
                        isRepeatingAnimation:false,
                        text: [
                          "    IF    ",
                          "    YOU    ",
                          "    WANNA TALK",
                          "    Then",
                          "    LET\'S TALKKKK",
                          "  ",
                        ],
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          fontFamily: "Permanent",
                          color:Color(0xFFD7C083),
                        ), // or
                      ),
                      Expanded(child: Container(child: Hero(tag:'leaf',child: Image.asset('Assets/leaf.png',color:Color(0xFFD3C0C5,).withOpacity(0.3),)),margin:EdgeInsets.only(top:50,),),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:120,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin:EdgeInsets.only(bottom:2,),
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(20),color:Colors.white,
                        ),
                        child: TextField(
                          textAlign:TextAlign.center,
                          style: TextStyle(
                            color:Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Type your message here',
                            suffixIcon: Icon(
                              Icons.arrow_forward,
                            ),
                            border:OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
                          ),
                          keyboardType:TextInputType.emailAddress,
                          onChanged: (value)
                          {
                            message=value;
                          },
                          onSubmitted:(message)
                            {
                              Text(message,style:TextStyle(
                                color:Colors.blue,
                              ),);
                            }
                            ),
                      ),
                    ),
                            IconButton(
                        icon: Icon(Icons.arrow_forward,size:40,),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            Container(
                              child:Text(message),color: Color(0xFFD7C083),
                              height: double.infinity,
                              width:double.infinity,
                            );
                          });
                          },
                        ),

              ],
            ),
    ],
            ),
          ],
        ),
      );
  }

}






