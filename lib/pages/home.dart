import 'package:flutter/material.dart';
import 'package:world_time/pages/loading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)?.settings.arguments;
    print(routeData);
    if (routeData != null && routeData is Map<String, dynamic>) {
      data = routeData;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/chooselocation');
                },
                icon: Icon(Icons.edit_location),
                label: Text('edit location'),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                  ),
                  SizedBox(height: 20,),
                  Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    letterSpacing: 2.0,
                  ),
                  ),
                  ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
