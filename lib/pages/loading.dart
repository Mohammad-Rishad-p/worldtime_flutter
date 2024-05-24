import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:world_time/service/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', time:'',flag: 'germany', url: "Europe/Riga");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chooselocation');
            }, 
            child: Text('go to choose location'),
          ),
          // Text('$time'),
        ],
      ),
    );
  }
}
