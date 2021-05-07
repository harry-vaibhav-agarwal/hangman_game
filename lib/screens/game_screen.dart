import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hang_man/constants.dart';
import 'package:hang_man/http/random.dart';
import 'package:hang_man/model/game.dart';
import 'package:hang_man/screens/status_screen.dart';
import 'package:hang_man/widgets/background.dart';
import 'package:hang_man/widgets/image_widget.dart';
import 'package:hang_man/widgets/alphabet_widget.dart';

class GameScreen extends StatefulWidget {

  static const String id = '/gamescreen';
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  RandomWordGenerator randomWordGenerator = RandomWordGenerator();
  bool status = false;
   Game game = new Game(
     lives: 5,
     secretWord: "",
     displayWord: "",
     seconds:60,
   );
   Timer _timer;

  @override
  void initState(){
    super.initState();
    startGame();
  }


  @override
  void dispose(){
    super.dispose();
    _timer.cancel();
  }
  void startTime(){

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(game.seconds <=0)
          getStatus(status);
        else
          --game.seconds;

        print('Seconds ${game.seconds}');
      });
    });


  }


  void startGame(){
    game.reset();
    Future.delayed(Duration.zero,()=>getWord());
  }


  Future getWord() async{
      var word = await randomWordGenerator.generateSecretWord();
      var displayWord = randomWordGenerator.generateDisplayWord(word);

      word = randomWordGenerator.addSpaces(word);
      displayWord = randomWordGenerator.addSpaces(displayWord);

     setState(()  {
       this.game.secretWord = word;
       this.game.displayWord = displayWord;

       print('Secret $word');
     });

     startTime();

  }


  void checkGameState(int index){
    print('Lives ${game.lives}');

    if(game.lives<=0)
      getStatus(status);
    else  if(game.check(index)){
      game.editDisplayWord(index);
      if(game.displayWord == game.secretWord){
        status= true;
        getStatus(status);
      }
    }
  }


  void getStatus(bool status){
    Navigator.pushReplacementNamed(context, StatusScreen.id,arguments: {
        "secretWord" : game.secretWord,
        "guessWord" : game.displayWord,
         "lives" : game.lives,
         "seconds" : game.seconds,
         "status" : status ? "WIN" : "LOSE",
    });
  }




  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body : SafeArea(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: game.displayWord=="" ? Text('Generating word...',style: kDisplayWordTextStyle,) :Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Flexible(
                          flex:6,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Lives : ${game.lives+1}',style: kLiveTextStyle,),
                                  Text('Time : ${game.seconds <10 ? 0:'' }${game.seconds}',style: kLiveTextStyle,)
                                ],
                              ),
                              SizedBox(height: 40,),
                              Flexible(
                                child: ImageWidget(
                                  imagePath: 'images/${max(0,game.lives+1)}.jpg',
                                ),
                              ),
                              SizedBox(height:50),
                              Text(
                                game.displayWord,
                                style: !status ? kDisplayWordTextStyle : kDisplayWordTextStyle.copyWith(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),],
                          ),
                        ),
                        Flexible(
                          flex:4,
                          child:Column(
                            children: [
                              SizedBox(height:40),
                              Flexible(
                                child: SizedBox(
                                  height: 250,
                                  child: GridView.count(
                                    scrollDirection:Axis.vertical,
                                    crossAxisCount: 6,
                                    childAspectRatio: 2,
                                    crossAxisSpacing: 7,
                                    mainAxisSpacing: 7,
                                    children: List.generate(26, (index) =>AlphabetWidget(
                                      alphabet: alphabets[index],
                                      onPressed: (){
                                        setState(() {
                                          checkGameState(index);
                                          }
                                        );
                                      },
                                      color: game.guessedletters[index] == GuessType.NONE? Colors.deepPurple : game.guessedletters[index]==GuessType.CORRECT ? Colors.green[800]:Colors.red[900],
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          )
                        )
                      ]
                  ),
                ),
              )
          )
      ),
    );
  }

}