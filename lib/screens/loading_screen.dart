import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hang_man/data/score_db.dart' as score_db;
import 'package:hang_man/screens/high_score_screen.dart';

class LoadingScreen extends StatefulWidget {

  static final id = '/loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    queryScores();
  }


  void queryScores() async {
      final database = score_db.openDB();
      var queryResult = await score_db.getScores(database);
      queryResult.sort((a,b)=>b.toString().compareTo(a.toString()));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HighScoreScreen(queryResult:queryResult) ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
