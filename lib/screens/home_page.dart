import "package:flutter/material.dart";
import 'package:mario/widgets/button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(flex: 4, child: Container(color: Colors.blue)),
        Expanded(
            flex: 1,
            child: Container(
              child: Container(
                  color: Colors.brown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Button(child: Icon(Icons.arrow_back)),
                      Button(child: Icon(Icons.arrow_upward)),
                      Button(child: Icon(Icons.arrow_forward))
                    ],
                  )),
            ))
      ],
    ));
  }
}
