import "package:flutter/material.dart";
import 'package:mario/widgets/button.dart';
import "dart:async";
import 'package:mario/widgets/mario.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double time = 0;
  double height = 0;
  static double marioX = -1;
  static double marioY = 1;
  double initialHeight = marioY;

  void preJump() {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    preJump();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;
      if (initialHeight - height > 1) {
        marioY = 1;
      } else {
        setState(() {
          marioY = initialHeight - height;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
            flex: 4,
            child: Container(
                color: Colors.blue,
                child: AnimatedContainer(
                    alignment: Alignment(marioX, marioY), duration: Duration(milliseconds: 0), child: Mario()))),
        Expanded(
            flex: 1,
            child: Container(
              child: Container(
                  color: Colors.brown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Button(child: Icon(Icons.arrow_back, color: Colors.white)),
                      Button(child: Icon(Icons.arrow_upward, color: Colors.white), function: jump),
                      Button(child: Icon(Icons.arrow_forward, color: Colors.white))
                    ],
                  )),
            ))
      ],
    ));
  }
}
