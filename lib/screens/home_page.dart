import "package:flutter/material.dart";
import 'package:mario/widgets/button.dart';
import 'package:mario/widgets/mario.dart';

class HomePage extends StatelessWidget {
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
                    alignment: Alignment(0, 1), duration: Duration(milliseconds: 0), child: Mario()))),
        Expanded(
            flex: 1,
            child: Container(
              child: Container(
                  color: Colors.brown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Button(child: Icon(Icons.arrow_back, color: Colors.white)),
                      Button(child: Icon(Icons.arrow_upward, color: Colors.white)),
                      Button(child: Icon(Icons.arrow_forward, color: Colors.white))
                    ],
                  )),
            ))
      ],
    ));
  }
}
