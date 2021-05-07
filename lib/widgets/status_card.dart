import 'package:flutter/material.dart';
import 'package:hang_man/constants.dart';
class StatusCard extends StatelessWidget {

  StatusCard({this.lives, this.seconds, this.guessWord, this.secretWord, this.status});

  final int lives;
  final int seconds;
  final String guessWord;
  final String secretWord;
  final String status;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height * 0.05),
      height: height*0.49,
      width: width*0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          colors: [Colors.red[900] ,Colors.indigo[700]],
          begin: Alignment.topLeft,
          end:Alignment.bottomRight,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("LIVES : ${lives}",style: kStatusCardTextStyle, ),
            SizedBox(height: 5,),
            Text("SECONDS : ${seconds}",style: kStatusCardTextStyle, ),
            SizedBox(height: 5,),
            FittedBox(child: Text("GUESS WORD : ${guessWord}",style: kStatusCardTextStyle, )),
            SizedBox(height: 5,),
            FittedBox(child: Text("SECRET WORD : ${secretWord}",style: kStatusCardTextStyle, )),
            SizedBox(height: 5,),
            Text("STATUS : ${status}",style: kStatusCardTextStyle.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ), ),

          ],
        ),
      ),
    );
  }
}
