import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:witchat/registrationscreen.dart';
import 'package:witchat/signinscreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class homescreen extends StatefulWidget {
  @override
  static String id='homescreen';
  _homescreenState createState() => _homescreenState();
}
class _homescreenState extends State<homescreen> with TickerProviderStateMixin{
  @override

  AnimationController controller;
  Animation animation;
  Animation animater;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this,);
    animation = ColorTween(begin: Color(0xFF202A43),end:Color(0xFF2E3A44))
        .animate(controller);

    animater= CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      drawerScrimColor: Color(0xFFF7EF01),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child:
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Hero(tag:'leaf',child: Image(image: AssetImage('Assets/leaf.png'),width:50,color:Color(0xFFD3C0C5),)),
                  TyperAnimatedTextKit(
                    isRepeatingAnimation:false,
                      text: [
                        "WITCHAT",
                      ],
                      textStyle: TextStyle(
                          fontSize: 40.0,
                          fontFamily: "Permanent",
                        color:Color(0xFFD7C083),
                      ),
                      textAlign: TextAlign.center, // or Alignment.topLeft
                  ),
                ],
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
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red)
                  ),
                  child: Text(
              'Sign In',textAlign:TextAlign.center, style: TextStyle(
                    letterSpacing: 1.5,fontSize:22,
                  ),
              ),
                  color:Color(0xFFDCE0F4),
                onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context,signinscreen.id);
                  });
                }
              ),
            ),
            SizedBox(
              height: 20,
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
              'Registration',textAlign:TextAlign.center,style: TextStyle(
                    fontSize:22,letterSpacing: 1.5,
                  ),
              ),
                  onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context,registrationscreen.id);
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
