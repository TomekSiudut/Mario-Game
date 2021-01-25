import 'dart:math';

import "package:flutter/material.dart";

class Mario extends StatelessWidget {
  final direction;
  final bool midrun;

  Mario({this.direction, this.midrun});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
          width: 50.0,
          height: 50.0,
          child: midrun ? Image.asset('lib/images/standingMario.png') : Image.asset('lib/images/runningMario.png'));
    } else {
      return Transform(
          transform: Matrix4.rotationY(pi),
          alignment: Alignment.center,
          child: Container(
              width: 50.0,
              height: 50.0,
              child:
                  midrun ? Image.asset('lib/images/standingMario.png') : Image.asset('lib/images/runningMario.png')));
    }
  }
}
