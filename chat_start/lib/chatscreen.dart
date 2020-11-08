import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';



String message;
final _auth=FirebaseAuth.instance;
final _firestone= FirebaseFirestore.instance;
User loggedinuser;
class chatscreen extends StatefulWidget {
  @override
  static const id='chatscreen';
  _chatscreenState createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  @override

  dynamic textcontrol=TextEditingController();

   void initState()
  {
    super.initState();
    print("chatscreen");
    getCurrentUser();
  }


   void getCurrentUser() async
  {

    try {
      final user = await _auth.currentUser;

      if (user != null) {
        loggedinuser=user;
      }
    }
    catch (e) {
      print(e);
    }
  }

  void messagestream() async
  {
   await for(var snapshot in _firestone.collection('messages').snapshots())
      {
        for(var messagex in snapshot.docs)
          {
            print('$snapshot hello');
           print('${messagex.data} okee');
          }
      }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:null,
        title:Text('Let\'s Chat',),
      ),
      backgroundColor: Color(0xFF303030),

        body: ListView(
          reverse:true,
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
                        data(),
                        Expanded(child: Container(child: Hero(tag:'leaf',child: Image.asset('Assets/leaf.png',color:Color(0xFFD3C0C5,).withOpacity(0.3),)),margin:EdgeInsets.only(top:50,),),),
                      ],

                    ),
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
                              controller:textcontrol,
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
                        onPressed: () async{_firestone.collection('messages').add({'text': message, 'sender': loggedinuser.email, 'timestamp': FieldValue.serverTimestamp(),});
                        //await  _firestone.collection('messages').add({'text':message,'sender':loggedinuser.email});
                          var x=messagestream();
                          textcontrol.clear();
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

class data extends StatefulWidget {
  @override
  _dataState createState() => _dataState();
}

class _dataState extends State<data> {
  @override
  String messagesender;
  String messageText;
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        SizedBox(height:10,),
    StreamBuilder<QuerySnapshot>(
      stream: _firestone.collection('messages').orderBy('timestamp', descending: true).snapshots(),
        //StreamBuilder <QuerySnapshot>(
        //stream:_firestone.collection('messages').snapshots(),
        builder:(context,snapshot) {
          final messages = snapshot.data.docs.reversed;
          String logged=loggedinuser.email;
          List<messagebubble> messagewidgets = [];
          for (var message in messages) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
            messageText = message.data()['text'];
            print(messageText);
            messagesender = message.data()['sender'];
            print(messagesender);
            if(messagesender==logged)
              {
                messagewidgets.add(messagebubble(messageText: messageText,messagesender:messagesender,isme:true));
                SizedBox(
                  height:20,
                );
              }

            else if(messagesender!=logged)
            {
              dynamic messagewidget =messagebubble(messageText: messageText,messagesender:messagesender,isme:false);
              messagewidgets.add(messagewidget);
              SizedBox(
                height:20,
              );
            }
          }
          print('${loggedinuser.email}');
          print('${messagesender}');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:messagewidgets,
          );
        },
        ),
      ],
    );
  }
}

class messagebubble extends StatelessWidget {

  final String messageText;
  final String messagesender;
  bool isme;

   messagebubble({
    this.messageText,this.messagesender,this.isme
  });

   @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:isme?CrossAxisAlignment.start:CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          padding:EdgeInsets.all(4),
          child: Material(
            color:isme?Colors.white70:Colors.yellow,
            type: MaterialType.card,
            elevation: 20,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft:Radius.circular(10),),
            child: Text(
              '$messageText', textAlign: TextAlign.left,),
            textStyle: TextStyle(letterSpacing: 2,
              color: Colors.black, fontSize: 18,
            ),
          ),
        ),

        Container(
            child: Material(
     borderRadius:BorderRadius.circular(20),
     child: Text(
     '$messagesender', textAlign: TextAlign.left, style: TextStyle(
     color: Colors.white, backgroundColor: Colors.blue,
     ),),),
     ),
      ],
    );
  }
}






