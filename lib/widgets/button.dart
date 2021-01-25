import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final child;
  final color;
  final Function function;
  Button({this.child, this.color, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(padding: EdgeInsets.all(10), color: Colors.brown[300], child: child)),
    );
  }
}
