import 'package:flutter/material.dart';
import 'package:hang_man/constants.dart';
class ButtonWidget extends StatelessWidget {

  ButtonWidget({this.onPressed,this.title});
  final Function onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end:Alignment.bottomRight,
          colors: [Colors.red[400],Colors.deepPurple,Colors.indigo[400]],
        )
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
       color: Colors.transparent,
        elevation: 5,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Text(
            title,
            style:kButtonTextStyle
          ),
        ),
      ),
    );
  }
}
