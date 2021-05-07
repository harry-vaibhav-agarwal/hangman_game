import 'package:flutter/material.dart';
import 'package:hang_man/screens/game_screen.dart';
import 'package:hang_man/screens/high_score_screen.dart';
import 'package:hang_man/screens/home_screen.dart';
import 'package:hang_man/screens/loading_screen.dart';
import 'package:hang_man/screens/status_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.id,
      routes:{
        HomeScreen.id : (context) => HomeScreen(),
        GameScreen.id : (context) => GameScreen(),
        HighScoreScreen.id : (context) => HighScoreScreen(),
        StatusScreen.id:(context) => StatusScreen(),
        LoadingScreen.id:(context) => LoadingScreen(),
       },
    );
  }
}

