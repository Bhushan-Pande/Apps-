import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ResultPage.dart';
import 'malefemaledetector.dart';

enum Gender{
Male,
Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {


  double height=180.0;
   int weight=70;
   int Age=20;
  Color malegender=Color(0xFFF1D67A);
  Color femalegender=Color(0xFFF1D67A);
  Color ChangeColor()
  {
    Color ct;
    ct=Color(0xFFD14928,);
    return ct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text(
          'BMI Calculator',
        ),
      ),
      body:SafeArea(
        child:ListView(                                        //best technique: Naitik Parmar(PA47)
        //mainAxisAlignment:MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: Genders(colour: malegender,icontype:Icon(FontAwesomeIcons.mars, size:32),gender:'Male',),
                  onTap:() {
                    setState(() {
                      malegender = Color(0xFFD14928);
                      femalegender= Color(0xFFF1D67A);
                    });
                  },
                  onDoubleTap:(){
                      setState(() {
                        malegender = Color(0xFFF1D67A);
                      });
                    }
                    ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Genders(colour: femalegender, icontype: Icon(FontAwesomeIcons.venus,size:32),gender:'Female',),
                      onTap:() {
                        setState(() {
                          femalegender = Color(0xFFD14928);
                          malegender= Color(0xFFF1D67A);
                        });
                      },
                      onDoubleTap:(){
                        setState(() {
                          femalegender = Color(0xFFF1D67A);
                        });
                      }
                  ),
                ),
              ],
            ),
          Expanded(
            child:Container(
            margin:EdgeInsets.all(15),
            padding:EdgeInsets.all(10),
            decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(5),
            color:Color(0xFFF1D67A),
            ),
            child:Column(

              children: <Widget>[
                Text('Height',textAlign: TextAlign.center,style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                Text(height.toStringAsFixed(1),style:TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Slider(
                  activeColor: Color(0xFFD14928),
                  inactiveColor: Color(0xFFEDE9E9),
                  value:height,
                  min:120,
                  max:240,
                  onChanged: (value)
                  {
                    setState(() {
                      height=value;
                      print(height);
                    });
                    },
                ),
              ],
            ),
            ),
          ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child:Container(
                      margin:EdgeInsets.all(15),
                      padding:EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(5),
                        color:Color(0xFFF1D67A),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text('Weight',style: TextStyle(
                            fontSize: 20, fontWeight:FontWeight.bold,
                          ) ,

                          ),
                          Text(weight.toStringAsFixed(1),style: TextStyle(
                            fontSize: 20, fontWeight:FontWeight.bold,
                          ) ,),
                      Row(
                        children: <Widget>[
                          RawMaterialButton(
                            elevation: 2.0,
                            shape: CircleBorder(),
                            fillColor: Colors.red,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });

                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 28,
                              height: 28,
                            ),
                          ),
                          RawMaterialButton(
                            elevation: 2.0,
                            shape: CircleBorder(),
                            fillColor: Colors.red,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                              },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 28.0,
                              height: 28.0,
                            ),
                          ),
                        ],
                      ),
    ],
                    ),
    ),

                ),

              Expanded(
                      child:Container(
                        margin:EdgeInsets.all(15),
                        padding:EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(5),
                        color:Color(0xFFF1D67A),
                        ),
                      child: Column(
                        children: <Widget>[
                        Text('Age',style: TextStyle(
                            fontSize: 20, fontWeight:FontWeight.bold,
                          ) ,

                      ),
                      Text(Age.toStringAsFixed(1),style: TextStyle(
                        fontSize: 20, fontWeight:FontWeight.bold,
                        ) ,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RawMaterialButton(
                          shape: CircleBorder(),
                          fillColor: Colors.red,
                          onPressed: (){
                            setState(() {
                              Age--;
                            });
                          },
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          constraints: BoxConstraints.tightFor(
                            width: 28.0,
                            height: 28.0,
                          ),
                        ),
                        RawMaterialButton(
                          shape: CircleBorder(),
                          fillColor: Colors.red,
                          onPressed: (){
                            setState(() {
                              Age++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          constraints: BoxConstraints.tightFor(
                            width: 28.0,
                            height: 28.0,
                          ),
                        ),
                      ],
                      ),
                    ],
                  ),
                ),

                ),


              ],
            ),

    FlatButton(
      child: Expanded(
      child: Container(
        child:Center(
        child: Text('Calculate',textAlign:TextAlign.center,style:TextStyle(
        fontSize:30,fontWeight: FontWeight.bold,
          color:Colors.black,
        ) ,),
      ),
        margin: EdgeInsets.fromLTRB(0, 55, 0, 2),
        padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(5),
      color:Colors.red,
      ),

      ),

      ),
      onPressed: ()
      {
        ResultPage Result= ResultPage(heightbmi:height,weightbmi:weight);

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResultPage(heightbmi: height,weightbmi:weight,)),
          );

        },
    ),
    ],

        ),

      ),

    );
  }
}


