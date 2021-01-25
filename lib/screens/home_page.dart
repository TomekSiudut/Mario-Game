import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:mario/widgets/button.dart';
import 'package:mario/widgets/jumping_mario.dart';
import "dart:async";
import 'package:mario/widgets/mario.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double time = 0;
  double height = 0;
  static double marioX = 0;
  static double marioY = 1;
  double initialHeight = marioY;
  String direction = "right";
  bool midrun = false;
  bool midJump = false;
  var gameFont = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white, fontSize: 20.0));

  void preJump() {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    preJump();
    midJump = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;
      if (initialHeight - height > 1) {
        midJump = false;
        setState(() {
          marioY = 1;
        });
        timer.cancel();
      } else {
        setState(() {
          marioY = initialHeight - height;
        });
      }
    });
  }

  void moveRight() {
    direction = "left";
    midrun = !midrun;

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (Button().userIsHoldingButtonNow() == true) {
        setState(() {
          marioX -= 0.02;
        });
      } else {
        timer.cancel();
      }
    });

    setState(() {
      marioX -= 0.02;
    });
  }

  void moveLeft() {
    direction = "right";
    midrun = !midrun;

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (Button().userIsHoldingButtonNow() == true) {
        setState(() {
          marioX += 0.02;
        });
      } else {
        timer.cancel();
      }
    });

    setState(() {
      marioX += 0.02;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
            flex: 4,
            child: Stack(children: <Widget>[
              Container(
                  color: Colors.blue,
                  child: AnimatedContainer(
                      alignment: Alignment(marioX, marioY),
                      duration: Duration(milliseconds: 0),
                      child: midJump
                          ? JumpingMario(
                              direction: direction,
                            )
                          : Mario(direction: direction, midrun: midrun))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("MARIO", style: gameFont),
                      Text("0000", style: gameFont),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("WORLD", style: gameFont),
                      Text("0000", style: gameFont),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("TIME", style: gameFont),
                      Text("0000", style: gameFont),
                    ],
                  )
                ],
              )
            ])),
        Expanded(
            flex: 1,
            child: Container(
              child: Container(
                  color: Colors.brown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Button(child: Icon(Icons.arrow_back, color: Colors.white), function: moveRight),
                      Button(child: Icon(Icons.arrow_upward, color: Colors.white), function: jump),
                      Button(child: Icon(Icons.arrow_forward, color: Colors.white), function: moveLeft)
                    ],
                  )),
            ))
      ],
    ));
  }
}
