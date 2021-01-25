import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final child;
  final color;
  Button({this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(padding: EdgeInsets.all(10), color: Colors.brown[300], child: child));
  }
}
