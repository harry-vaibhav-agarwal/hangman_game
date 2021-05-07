import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hang_man/constants.dart';
import 'package:hang_man/widgets/background.dart';
import 'package:hang_man/data/score_db.dart' as score_db;

class HighScoreScreen extends StatelessWidget{

  HighScoreScreen({this.queryResult});
  static const String id = '/high_score_screen';

  final queryResult;

  @override
  Widget build(BuildContext context) {



   return SafeArea(
     child: Background(
       child: queryResult==null || queryResult.length==0 ? Center(child: Text("No Scores Yet",style: kDisplayWordTextStyle,)) :
        Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             child : Stack(
               alignment: AlignmentDirectional.topCenter,
               children: [
                 Container(
                   padding: EdgeInsets.fromLTRB(10, 30, 6, 10),
                   child:Text(
                     'HIGH SCORES',
                     style: kHeadingTextStyle,
                   )
                 ),
                 GestureDetector(
                   onTap: (){Navigator.pop(context);},
                   child: Container(
                       padding: EdgeInsets.fromLTRB(10, 30, 6, 10),
                     alignment: Alignment.topLeft,
                       child:Icon(
                         Icons.home,
                         size: 30,
                         color: Colors.white,
                       )
                   ),
                 ),
               ],
             ),
           ),
           buildRow('Rank','Date','LivesLeft','TimeLeft',kDisplayScoreTextStyle.copyWith(
             color:Colors.white,
           )),
           Expanded(
             child: ListView.builder(
               scrollDirection: Axis.vertical,
               itemCount: min(5,queryResult.length),
               itemBuilder: (context,index) {
                 if (queryResult == null)
                   return null;
                 else {
                   List<String> topRanks = ["🥇", "🥈", "🥉"];

                   var row = queryResult[index].toString().split(",");
                   String rank = (index<3) ? topRanks[index] + (index+1).toString() : (index+1).toString();
                   String livesLeft = row[0];
                   String secondsLeft = row[1];
                   var date = row[2].split(" ")[0].split("-");
                   String scoreDate = formatDate(
                       DateTime(int.parse(date[0]), int.parse(date[1]),
                           int.parse(date[2])),
                       [yy, '-', M, '-', d]);
                   return buildRow(rank, scoreDate, livesLeft,
                       secondsLeft, kDisplayScoreTextStyle);
                 }
               }
             ),
           )

         ],
       ),
     ),
   );
  }
}


Widget buildRow(String a,String b,String c,String d,TextStyle style){
  return Padding(
    padding: const EdgeInsets.only(top:25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Spacer(),
        Flexible(flex:4,child: Text(a,style: style,)),
        Spacer(),
        Flexible(flex:9,child: Text(b,style: style,)),
       Spacer(),
        Flexible(flex:9,child: Text(c,style: style,)),
        Spacer(),
        Flexible(flex:9,child: Text(d,style: style,)),
        //Spacer(),
      ],
    ),
  );
}