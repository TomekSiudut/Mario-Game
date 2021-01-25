import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final child;
  Button({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.brown[300], child: child);
  }
}
