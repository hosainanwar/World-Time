import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState()=> _LoadingState();
}

class _LoadingState extends State<Loading>{

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Dhaka', flag: 'Bangladesh.png', url: 'Asia/Dhaka');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isdaytime':instance.isDaytime,
    });
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}