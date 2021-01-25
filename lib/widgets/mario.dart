import 'dart:math';

import "package:flutter/material.dart";

class Mario extends StatelessWidget {
  final direction;
  final bool midrun;
  final size;

  Mario({this.direction, this.midrun, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
          width: size,
          height: size,
          child: midrun ? Image.asset('lib/images/standingMario.png') : Image.asset('lib/images/runningMario.png'));
    } else {
      return Transform(
          transform: Matrix4.rotationY(pi),
          alignment: Alignment.center,
          child: Container(
              width: size,
              height: size,
              child:
                  midrun ? Image.asset('lib/images/standingMario.png') : Image.asset('lib/images/runningMario.png')));
    }
  }
}
