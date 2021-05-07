import 'package:flutter/material.dart';
class Background extends StatelessWidget {
  Background({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end:Alignment.bottomRight,
        colors: [Colors.red,Colors.deepPurple,Colors.indigo[900]],
         ),
        ),
        child: child,
    );
  }
}
