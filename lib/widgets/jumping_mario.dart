import "package:flutter/material.dart";
import "dart:math";

class JumpingMario extends StatelessWidget {
  final direction;
  JumpingMario({this.direction});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: 50.0,
        height: 50.0,
        child: Image.asset('lib/images/jumpingMario.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 50.0,
          height: 50.0,
          child: Image.asset('lib/images/jumpingMario.png'),
        ),
      );
    }
  }
}
