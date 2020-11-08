import 'package:flutter/material.dart';
import 'chatscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class signinscreen extends StatefulWidget {
  @override
  static const id='signinscreen';
  _signinscreenState createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  @override
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  bool showspinner=false;

  static const id='signinscreen';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      body: ModalProgressHUD(
        inAsyncCall:showspinner,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('Assets/leaf.png'),
                      width: 50,
                      color:Color(0xFFD3C0C5)),
                  Container(
                    child:
                    Text(
                      'Sign In', textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD7C083),
                        letterSpacing: 2,
                        fontSize: 42,
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
                  borderRadius: BorderRadius.circular(20), color: Colors.white,
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                    print(email);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white,
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    password = value;
                    print(password);
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
                    color: Color(0xFFDCE0F4),
                    child: Text(
                      'Sign In', textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 22, letterSpacing: 1.5,
                    ),
                    ),
                    onPressed: () async{
                      setState(() {
                        showspinner=true;
                      });
                      try{
                        final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            setState(() {
                              Navigator.pushNamed(context, chatscreen.id);
                            });
                          }
                        setState(() {
                          showspinner=false;
                        });
                       }
                        catch(e)
                        {
                          print(e);
                        }
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










































































