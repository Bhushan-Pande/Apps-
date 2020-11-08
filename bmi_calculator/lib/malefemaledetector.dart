
import 'package:flutter/cupertino.dart';

class Genders extends StatelessWidget {
  const Genders({@required this.colour,@required this.icontype, @required this.gender});

  final Color colour;
  final Icon icontype;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(5),
        color:colour,
      ),
      margin:EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
            icontype,
          Text(
            gender,
            style:TextStyle(
              fontWeight:FontWeight.bold,
            ),
          ),
        ],
      ),
      //color:Colors.red,
    );
  }
}