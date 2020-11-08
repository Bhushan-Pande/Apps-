import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override

  void voice_note(int sound_number)
  {
    final player = AudioCache();
    player.play('note$sound_number.wav');

  }
  Expanded give_me_sound({ Color Color1,int sound_number})
{return
  Expanded(
    child:FlatButton(
      color:Color1,
  onPressed:()
{
  voice_note(sound_number);
}

  ),
  );
}

  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title:Text('Xylophone')
        ),
        body:
        SafeArea(child:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              give_me_sound(Color1:Colors.red,sound_number: 1),
              give_me_sound(Color1:Colors.yellow,sound_number: 2),
              give_me_sound(Color1:Colors.blue,sound_number: 3),
              give_me_sound(Color1:Colors.green,sound_number: 4),
              give_me_sound(Color1:Colors.pink,sound_number: 5),
              give_me_sound(Color1:Colors.black,sound_number: 6),
              give_me_sound(Color1:Colors.grey,sound_number: 7),
            ],
          ),
        )
      ),
    ),
    );
  }
}
