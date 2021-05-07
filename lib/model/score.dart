class Score{


  Score({this.id,this.scoreDate,this.livesLeft,this.secondsLeft});

  final int id;
  final String scoreDate;
  final int livesLeft;
  final int secondsLeft;


   Map<String,dynamic> toMap(){
     return {
       "scoreDate" : scoreDate,
       "livesLeft" :livesLeft,
       "secondsLeft" : secondsLeft,
     };
   }

   @override
  String toString() {
    // TODO: implement toString
    return '$livesLeft,$secondsLeft,$scoreDate';
  }

}