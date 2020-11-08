import 'package:flutter/material.dart';
import 'dart:math';

void main()
{
  return runApp(MaterialApp(
    home:Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar:AppBar(
        backgroundColor:Colors.grey[600],
        title:Text("Dice Roll and enjoy"),
      ),
      body:dicepage()
    ),

    ),
  );

}

class dicepage extends StatefulWidget {
  @override
  _dicepageState createState() => _dicepageState();
}

class _dicepageState extends State<dicepage> {
  @override
  int left_dice_number=1;
  int right_dice_number=5;
  Widget build(BuildContext context) {
    return
    Center(
      child:Row(
      children: <Widget>[
        Expanded(
          child:FlatButton(
            onPressed:()
            {
              setState(() {
                left_dice_number=Random().nextInt(6)+1;
                right_dice_number=Random().nextInt(6)+1;
              });
            },
          child:Image(
          image: AssetImage('images/dice$left_dice_number.png'),
        ),
        ),
        ),
        Expanded(
          child:FlatButton(
            onPressed:()
            {
              setState(() {
                left_dice_number=Random().nextInt(6)+1;
                right_dice_number=Random().nextInt(6)+1;
              });
            },
            child:Image(
              image: AssetImage('images/dice$right_dice_number.png'),
            ),
          ),
        ),
      ],
      ),
    );
  }
}
