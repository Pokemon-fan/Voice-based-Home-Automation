import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ManualControl extends StatefulWidget {
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
        print(lights);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    retrieveData('Lights');
  }

  bool flag1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iHome.ly'),
        backgroundColor: Color(0xFFB27409),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: Image.asset(
              'assets/icon.png',
              height: 150,
              width: 150,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            height: 300.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 200.0,
                  color: Colors.orangeAccent[100],
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(5, 30, 5, 20),
                    child: Column(
                      children: [
                        Text(
                          'Living Room',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ), //TODO: ONPRESSED COMMANDS: ON/OFF
                        FlatButton.icon(
                          onPressed: () {
                            if (!flag1) {
                              //true is on ,false is off
                              flag1 = true;
                              fb.reference().child("Room1/Light1").set("ON");
                            } else {
                              flag1 = false;
                              fb.reference().child("Room1/Light1").set("OFF");
                            }
                            retrieveData("Lights");
                          },
                          icon: Icon(Icons.power_settings_new),
                          label: Text('Light 1'),
                          color: (lights == "OFF")
                              ? Colors.red
                              : Colors.green[100],
                        ),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('Light 2'),
                            color: Colors.green[100]),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('Light 3'),
                            color: Colors.green[100]),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('All'),
                            color: Colors.green[100]),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 200.0,
                  color: Colors.orangeAccent[100],
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(5, 30, 5, 20),
                    child: Column(
                      children: [
                        Text(
                          'Bedroom',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ), //TODO: ONPRESSED COMMANDS: ON/OFF
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.power_settings_new),
                          label: Text('Light 1'),
                          color: Colors.green[100],
                        ),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('Light 2'),
                            color: Colors.green[100]),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('Light 3'),
                            color: Colors.green[100]),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('All'),
                            color: Colors.green[100]),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 200.0,
                  color: Colors.orangeAccent[100],
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(5, 30, 5, 20),
                    child: Column(
                      children: [
                        Text(
                          'Kitchen',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ), //TODO: ONPRESSED COMMANDS: ON/OFF
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.power_settings_new),
                          label: Text('Light 1'),
                          color: Colors.green[100],
                        ),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('Light 2'),
                            color: Colors.green[100]),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('Light 3'),
                            color: Colors.green[100]),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('All'),
                            color: Colors.green[100]),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 200.0,
                  color: Colors.orangeAccent[100],
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(5, 30, 5, 20),
                    child: Column(
                      children: [
                        Text(
                          'Dining Room',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ), //TODO: ONPRESSED COMMANDS: ON/OFF
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.power_settings_new),
                          label: Text('Light 1'),
                          color: Colors.green[100],
                        ),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('Light 2'),
                            color: Colors.green[100]),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('Light 3'),
                            color: Colors.green[100]),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.power_settings_new),
                            label: Text('All'),
                            color: Colors.green[100]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "LIGHTS STATUS:",
//                   style: TextStyle(color: Colors.black, fontSize: 25),
//                 ),
//                 SizedBox(width: 25,),
//                 Text(
//                   lights,
//                   style: TextStyle(color: lights=='ON'?Colors.green:Colors.red, fontSize: 25),
//                 ),
//               ],
//             ),

//             Column(
//               children: <Widget>[
//                 RaisedButton(
//                     child: Container(
//                       width: 100,
//                       child: Text(
//                         "ON",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     color: Colors.black,
//                     onPressed: () {
//                       fb.reference().child("Lights").set("ON");
//                       retrieveData('Lights');
//                     }),
//                 SizedBox(height: 20,),
//                 RaisedButton(
//                     child: Container(
//                       width: 100,
//                       child: Text(
//                         "OFF",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     color: Colors.black,
//                     onPressed: () {
//                       fb.reference().child("Lights").set("OFF");
//                       retrieveData('Lights');
//                     })
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
