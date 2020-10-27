import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:firebase_database/firebase_database.dart';

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'lights': HighlightedWord(
      onTap: () => print('lights'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'light': HighlightedWord(
      onTap: () => print('lights'),
      textStyle: const TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
    ),
    'off': HighlightedWord(
      onTap: () => print('off'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'on': HighlightedWord(
      onTap: () => print('on'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking to input command';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB27409),
        automaticallyImplyLeading: false,
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
        // Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Colors.redAccent,
        endRadius: 75.0,
        duration: Duration(milliseconds: 2000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Color(0xFFB27409),
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          child: Column(
            children: <Widget>[
              _isListening
                  ? Container(
                      color: Colors.green,
                      child: Container(
                        child: Center(
                            child: Text(
                          "PRESS THE BUTTON AGAIN TO STOP LISTENING!",
                          textAlign: TextAlign.center,
                        )),
                      ),
                    )
                  : SizedBox(),
              Container(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                child: TextHighlight(
                  text: _text.isEmpty ? "Waiting..." : _text,
                  words: _highlights,
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _text = responseToSpeech(_text);
      });
      _speech.stop();
    }
  }
}

String responseToSpeech(String text) {
  final fb = FirebaseDatabase.instance;
  List textList = text.split(' ');
  bool status;
  String device;
  if (text == "nope" ||
      text == "no thank you" ||
      text == "that's it" ||
      text == "that is it" ||
      text == "this is enough")
    return "Ok then, have a good day!";
  else if (text == "hi" || text == "hi how are you doing" || text == "hello")
    return "Hi, please press the button twice to speak your command.";

  for (var value in textList) {
    if (value == 'on')
      status = true;
    else if (value == 'off')
      status = false;
    else if (value == 'lights' || value == 'light')
      device = 'Lights';
    else
      continue;
  }

  if (status == true && device == 'Lights') {
    fb.reference().child("Room1/Light1").set("ON");
    return "Ok! Turning On the Lights. Anything else?";
  } else if (status == false && device == 'Lights') {
    fb.reference().child("Room1/Light1").set("OFF");
    return "Ok! Turning Off the Lights. Anything else?";
  } else
    return "Sorry your command was invalid. You can try again!";
}
