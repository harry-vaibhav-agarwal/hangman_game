import 'package:flutter/material.dart';
import 'package:hang_man/constants.dart';
import 'package:hang_man/model/score.dart';
import 'package:hang_man/screens/game_screen.dart';
import 'package:hang_man/widgets/background.dart';
import 'package:hang_man/widgets/button_widget.dart';
import 'package:hang_man/widgets/status_card.dart';
import 'home_screen.dart';
import 'package:hang_man/data/score_db.dart' as score_db;

class StatusScreen extends StatelessWidget {
   static const String id = '/losescreen';
  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final database = score_db.openDB();
    score_db.manipulateDatabase(Score(
      livesLeft: data["lives"],
      secondsLeft: data["seconds"],
      scoreDate: DateTime.now().toString(),
    ), database);


    return Background(
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StatusCard(
              lives: data["lives"],
              seconds: data["seconds"],
              guessWord: data["guessWord"],
              secretWord: data["secretWord"],
              status : data["status"],
            ),
            SizedBox(height: 15,),
            ButtonWidget(
              title:"Play Again",
              onPressed: (){
                Navigator.pushNamed(context, GameScreen.id);
              },
            ),
            SizedBox(height: 15,),
            ButtonWidget(
              title:"Main Menu",
              onPressed: (){
                Navigator.pushNamed(context, HomeScreen.id);
              },
            ),
            SizedBox(height:50),
          ],
        )
      ),
    );
  }
}
