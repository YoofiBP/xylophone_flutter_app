import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  playSound(int fileNumber) {
    AudioCache player = AudioCache();
    player.play('note$fileNumber.wav');
  }

  Expanded buildKey(int soundFile, Color color) => Expanded(
        child: FlatButton(
          color: color,
          onPressed: () {
            playSound(soundFile);
          },
        ),
      );

  List<Expanded> buildChildren() {
    var properties = [
      {"soundFile": 1, "color": Colors.red},
      {"soundFile": 2, "color": Colors.orange},
      {"soundFile": 3, "color": Colors.yellow},
      {"soundFile": 4, "color": Colors.green},
      {"soundFile": 5, "color": Colors.blue},
      {"soundFile": 6, "color": Colors.indigo},
      {"soundFile": 7, "color": Colors.purple},
    ];

    List<Expanded> keys = [];

    properties.forEach((element) {
      keys.add(buildKey(element["soundFile"], element["color"]));
    });

    return keys;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildChildren(),
          ),
        ),
      ),
    );
  }
}
