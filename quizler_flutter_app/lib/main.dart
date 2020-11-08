import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



void main()
{

  runApp(myApp());
}


class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}


class _myAppState extends State<myApp> {
  int question_number=0;

  List <Icon> scorekeeper=[];

  List <String> questions=[
    "Marrakesh is the capital of Morocco",
    "Waterloo has the greatest number of tube platforms in London",
    "M&M stands for Mars and Moordale",
    "Gin is typically included in a Long Island Iced Tea",
    "The unicorn is the national animal of Scotland",
    "Howard Donald is the oldest member of Take That",
    "There are 219 episodes of Friends",
    "A lion roar can be heard up to eight kilometres away",
    "In Harry Potter, Draco Malfoy has no siblings",
    "Louis Walsh is older than Simon Cowell",
    "Monaco is the smallest country in the world",
    'What Do You Mean was Justin Biebers first UK number one single',
    'The river Seine in Paris is longer than the river Thames in London',
    'A cara cara navel is a type of orange',
    'There are five different blood groups',
    'Cinderella was the first Disney princess',
    'ASOS stands for As Seen On Screen',
    'The Battle Of Hastings took place in 1066',
    'H&M stands for Hennes & Mauritz',
    'Canis lupur is the scientific name for a wolf',
    'K is worth four points in Scrabble',
    'Alaska is the biggest American state in square miles',
    'Ariana Grande is 25 or under',
    'Australia is wider than the moon',
    'Queen Elizabeth II is currently the second longest reigning British monarch',
    'Madonnas real name is Madonna',
    'Serena Williams has one more singles tennis Grand Slam titles than sister Venus',
    'Alexander Fleming discovered penicillin',
  ];


  List <Icon> nextscorekeeper=[];

  Row shiftingrows(int questionnumber)
  {
    Row ro;
    if(question_number<15)
      {
       ro= Row
        (
         children:scorekeeper,
        );
      }
      else if(question_number<(questions.length))
      {
        ro=Row
          (
          children:nextscorekeeper,
        );
      }

    return ro;
  }

  Future<bool> showalert()
  {Future<bool> alt;

    alt=Alert(
    context: context,
    title: 'Finished!',
    desc: 'You\'ve reached the end of the quiz.',
    ).show();
    return alt;
  }

int count=0;
  Icon checkanswer(int question_number, String userpicked)
  {
    Icon ic;
    if(answers[question_number]==userpicked)
      {
        ic=Icon(
          Icons.done,
          color: Colors.green,
        );
        count++;
      }
    else
      {
        ic=Icon(
          Icons.clear,
          color:Colors.red,
        );
      }
    print(answers.length);
    return ic;
  }




  //Answers
  List <String> answers=[
    "True",
    "False",
    "True",
    "True",
    "True",
    "False",
    "False",
    "True",
    "False",
    "False",
    "False",
    'True',
    'True',
    'True',
    'False',
    'True',
    'True',
    'True',
    'False',
    'False',
    'False',
    'True',
    'True',
    'True',
    'False',
    'False',
    'True',
    'True',
  ];


  Expanded qdisplay()
  {
    Expanded st;

      st=Expanded(
        flex:6,
        child: Stack(
          alignment: Alignment.center,
          children:<Widget>[
            Image.network(
              'https://img.freepik.com/free-photo/empty-wooden-table-with-smoke-float-up-dark-background_68495-135.jpg?size=626&ext=jpg',
            ),
            Text(questions[question_number],textAlign:TextAlign.center,style: TextStyle(
              fontSize: 15, color: Colors.white, decorationColor: Colors.blueGrey, fontWeight: FontWeight.w800,
            ),
            ),
          ],
        ),
      );
      return st;
    }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title:Text('QUIZ APP',style: TextStyle(
            color:Colors.black
          ),),
          backgroundColor: Colors.white70,
        ),
        backgroundColor: Colors.black87,
        body: SafeArea(maintainBottomViewPadding:true,child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           qdisplay(),
          Expanded(
              child: Container(
                margin:EdgeInsets.only(bottom:6),
                  child:FlatButton(
                    onPressed: (){
                      setState((){
                        if(question_number<15)
                        {
                          scorekeeper.add(checkanswer(question_number,'True'));
                        }

                        else if(question_number>=27)
                        {
                          showalert();

                          question_number=0;
                          //TODO Step 4 Part D - empty out the scoreKeeper.
                          scorekeeper = [];
                          nextscorekeeper=[];
                        }

                        else
                          {
                            nextscorekeeper.add(checkanswer(question_number,'True'));
                          }
                        question_number++;
                      });
                    },
                    color: Colors.green,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    child:Text(
                      'True',
                      style: TextStyle(
                        fontSize:20,
                      ) ,
                    ),
                  ),
                ),

            ),
            Expanded(
              child:Container(
                margin:
                EdgeInsets.only(bottom:6),
                  child:FlatButton(
                    padding:EdgeInsets.all(4),
                onPressed: (){
                  setState((){
                    if(question_number<15){
                      scorekeeper.add(checkanswer(question_number,'False'));
                    }

                    else if(question_number>=26)
                    {
                      showalert();

                      question_number=0;
                      //TODO Step 4 Part D - empty out the scoreKeeper.
                      scorekeeper = [];
                      nextscorekeeper=[];
                    }
                    else
                    {
                      nextscorekeeper.add(checkanswer(question_number,'False'));
                    }
                    question_number++;
                  });
                  },
                color: Colors.red,
                child:Text(
                  'False',
                  style: TextStyle(
                    fontSize:20,
                  ) ,
                ),
              ),
            ),

            ),
            shiftingrows(question_number),
          ],
        ),
        ),
      ),
    );

  }
}




