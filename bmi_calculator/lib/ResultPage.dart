import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ResultPage extends StatelessWidget {

   ResultPage({@required this.heightbmi,@required this.weightbmi});

  final heightbmi;
  final weightbmi;

  double _bmi;
  String calculateBMI(heightbmi,weightbmi) {
      _bmi = weightbmi / pow(heightbmi / 100, 2);
      return _bmi.toStringAsFixed(1);
    }

    String getResult(_bmi) {
      if (_bmi >= 25) {
        return 'Overweight';
      } else if (_bmi > 18.5) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    }

    String getInterpretation(_bmi) {
      if (_bmi >= 25) {
        return 'You have a higher body weight. Try to exercise more.';
      } else if (_bmi >= 18.5) {
        return 'You have a normal body weight. Good job!';
      } else {
        return 'You have a lower normal body weight. You can eat a bit more.';
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
     body:SafeArea(
     child:Column(
           children: <Widget>[

       SizedBox(
       height: 20,
       ),
       Container(
               padding:EdgeInsets.all(5),
               child: Expanded(
                 child:Text('Result page',textAlign:TextAlign.left,style: TextStyle(
                     fontSize: 25, fontWeight:FontWeight.bold, color: Colors.white,
                 ),),
               ),
             ),
             SizedBox(
               height: 20,
             ),
             Expanded(
               flex:8,
               child: Container(
                 padding:EdgeInsets.all(20),
                 decoration: BoxDecoration(
                   borderRadius:BorderRadius.circular(10),
                   color:Color(0xFF262629),
                 ),
                 margin: EdgeInsets.all(5),

                 child:ListView(
                   padding: EdgeInsets.all(10),
                   //crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: <Widget>[
                     Text('Your score',textAlign:TextAlign.center,style:TextStyle(
                   fontSize: 25, fontWeight:FontWeight.bold,color: Color(0xFFBCBCBC),
                 ),),
                     SizedBox(
                       height: 20,
                       child: Divider(
                         thickness:5
                       )
                     ),
                     Expanded(
                           flex:5,
                           child: Container(
                             padding: EdgeInsets.all(60),
                             decoration: BoxDecoration(
                               borderRadius:BorderRadius.circular(10),
                               color:Color(0xFFBCBCBC),
                             ),
                             child:
                             Column(
                               children: <Widget>[


                                 SizedBox(
                                   height: 20,
                                 ),
                                 Text(calculateBMI(heightbmi,weightbmi),textAlign:TextAlign.center,style:TextStyle(
                                   fontSize: 40, fontWeight:FontWeight.bold,color:Color(0xFF621646),
                                 ),),

                                 SizedBox(
                                   height: 10,
                                 ),

                                 Text(getResult(_bmi),textAlign:TextAlign.center,style:TextStyle(
                                   fontSize: 30, fontWeight:FontWeight.bold,color:Color(0xFF070507),
                                 ),),

                                 SizedBox(
                                   height: 20,
                                 ),

                                 Text(getInterpretation(_bmi),textAlign:TextAlign.center,style:TextStyle(
                                   fontSize: 20, fontWeight:FontWeight.bold,color:Colors.green,
                                 ),),
                               ],
                             ),
                         ),
                     ),
                       ],
                     ),
               ),
             ),

             FlatButton(
               child: Expanded(
                 child: Container(
                   child:Center(
                     child: Text('Recalculate',textAlign:TextAlign.center,style:TextStyle(
                       fontSize:30,fontWeight: FontWeight.bold,
                       color:Colors.black,
                     ) ,),
                   ),
                   margin: EdgeInsets.fromLTRB(3, 25, 3, 5),
                   padding: EdgeInsets.all(15.0),
                   decoration: BoxDecoration(
                     borderRadius:BorderRadius.circular(5),
                     color:Color(0xFFB2020D),
                   ),
                 ),

               ),
               onPressed: ()
              {
                Navigator.pop(
                  context,);
              }


             ),

           ],

         ),
     ),
     );

  }
}






