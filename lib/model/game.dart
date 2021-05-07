import 'package:hang_man/constants.dart';


enum GuessType {
  NONE,
  CORRECT,
  WRONG
}

class Game {
  int lives;
  String secretWord;
  String displayWord;
  int seconds;
  List<GuessType>guessedletters = List.generate(26, (index) =>GuessType.NONE);
  Game({this.lives,this.secretWord,this.displayWord,this.seconds});


  bool check(int index){
    if(secretWord.contains(alphabets[index])) {
      guessedletters[index]=GuessType.CORRECT;
      return true;
    }

    guessedletters[index]=GuessType.WRONG;

    lives--;
    return false;
  }

  void editDisplayWord(int index){
    var letter = alphabets[index];
    String result="";
    for(int i=0;i<secretWord.length;i++){
      if(secretWord[i]==letter)
        result+=letter;
      else
        result+=displayWord[i];
    }
    displayWord = result;
  }

  void reset(){
    lives=5;
    secretWord="";
    displayWord="";
    guessedletters=List.generate(26, (index) => GuessType.NONE);
  }
}