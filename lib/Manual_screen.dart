import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class ManualControl extends StatefulWidget {
  ManualControl({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ManualControlState createState() => _ManualControlState();
}

class _ManualControlState extends State<ManualControl> {
  final fb = FirebaseDatabase.instance;
  String lights = 'OFF';
  retrieveData(String device) async {
    await fb.reference().child(device).once().then((DataSnapshot data) {
      setState(() {
        if (device == "Lights") lights = data.value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveData('Lights');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LIGHTS STATUS:",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                SizedBox(width: 25,),
                Text(
                  lights,
                  style: TextStyle(color: lights=='ON'?Colors.green:Colors.red, fontSize: 25),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                RaisedButton(
                    child: Container(
                      width: 100,
                      child: Text(
                        "ON",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.black,
                    onPressed: () {
                      fb.reference().child("Lights").set("ON");
                      retrieveData('Lights');
                    }),
                SizedBox(height: 20,),
                RaisedButton(
                    child: Container(
                      width: 100,
                      child: Text(
                        "OFF",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.black,
                    onPressed: () {
                      fb.reference().child("Lights").set("OFF");
                      retrieveData('Lights');
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
