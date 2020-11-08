import 'dart:async';

import 'package:clima/firstscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const Apikey='4069569239b5adb35b3ad7fb4a84f4f0';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  double temp=0;
  double latitude;
  double longitude;
  dynamic jsons;
  dynamic city='Finding location....';

  void initState()
  {
    super.initState();
    print('started');
    getLocation();
  }


  Future<dynamic> getLocation() async
  {
    Position position =await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    latitude=position.latitude;
    print('lat:$latitude');
    longitude=position.longitude;
    print('lon:$longitude');
    http.Response response = await http.get('$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$Apikey&units=metric');
    if (response.statusCode == 200) {
      print("hello");
      jsons=jsonDecode(response.body);
      print(jsons);
      setState(() {
        temp=jsons['main']['temp'];
        city=jsons['name'];
        print(city);
      });

    }
    else {
      throw Exception('Failed to load album');
    }
  }


  String getMessage(double temp) {
    if (temp > 25) {
        return ('It\'s 🍦 time');
      } else if (temp > 20 && temp<25) {
        return ('Time for shorts and 👕');
      } else if (temp < 10 && temp>=1) {
        return ('You\'ll need 🧣 and 🧤');
      }
      else if(temp==0)
      {
        return('Wait....');
      }
      else {
        return ('Bring a 🧥 just in case');
      }
  }



  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFF010005),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 63,
                width: 80,
              ),
              Text('${temp.toInt()}°C',textAlign:TextAlign.center,style: TextStyle(
                  color:Colors.white,fontSize: 42,
                ),),



              SizedBox(
                height: 63,
                width: 80,
                child:Divider(
                  height: 20,
                  endIndent:12,
                  color: Colors.white,
                ),
              ),

              Align(
                alignment: Alignment.center,
                child:Text('${city}',style: TextStyle(
                  color:Color(0xFFFC4B46),fontSize: 42,
                ),),
              ),
              Expanded(
                child:Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset('Images/weather.jpg'),),
              ),

              Align(
                alignment: Alignment.center,
                child:Text('${getMessage(temp)}',style: TextStyle(
                  color:Colors.white,fontSize: 42,
                ),),
              ),
            ],
          ),
        ),
      );
    }
}
































