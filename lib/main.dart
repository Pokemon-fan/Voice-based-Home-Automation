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
        backgroundColor: Color(0xFFB27409),
        title: Center(
          child: Row(
            children: [
              Icon(Icons.menu),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'iHome.ly',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFFB27409), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Container(
                    height: 50,
                    width: 250,
                    child: Center(
                      child: Text(
                        "Voice Control",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFFB27409),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpeechScreen(),
                        ));
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.white,
                    onPressed: () {},
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 50,
                            color: Color(0xFFB27409),
                          ),
                          Text(
                            "Add a new \nAppliance",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFFB27409),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.white,
                    onPressed: () {},
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.settings,
                            size: 50,
                            color: Color(0xFFB27409),
                          ),
                          Text(
                            "Manage \nexisting",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFFB27409),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Container(
                    height: 50,
                    width: 250,
                    child: Center(
                      child: Text(
                        "Manual Control",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFFB27409),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManualControl(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
