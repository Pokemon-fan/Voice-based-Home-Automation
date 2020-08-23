import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_prj/Voice_screen.dart';
import 'Manual_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IOT PRJ',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IOT PROJECT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Container(
                  width: 100,
                  child: Text(
                    "Manual Control",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManualControl(title: 'IOT PROJECT'),));
                }),
            RaisedButton(
                child: Container(
                  width: 100,
                  child: Text(
                    "Voice Control",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SpeechScreen(),));
                })
          ],
        ),
      ),
    );
  }
}

