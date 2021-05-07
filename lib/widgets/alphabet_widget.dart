import 'package:flutter/material.dart';
import 'package:hang_man/constants.dart';
class AlphabetWidget extends StatelessWidget {


  AlphabetWidget({this.alphabet,this.onPressed,this.color});
  final String alphabet;
  final Function onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
           color:color,
          ),


        child: Center(
          child: Text(
            alphabet,
            style: kAlphabetTextStyle,
          ),
        ),
      ),
    );
  }
}
