import 'package:flutter/material.dart';
import 'package:hang_man/constants.dart';
import 'package:hang_man/screens/loading_screen.dart';
import 'package:hang_man/widgets/background.dart';
import 'package:hang_man/widgets/image_widget.dart';
import 'high_score_screen.dart';
import 'package:hang_man/screens/game_screen.dart';
import 'package:hang_man/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/homepage';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body : SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Flexible(
                    flex: 7,
                    child:Column(
                      children: [
                        SizedBox(height: 20,),
                        Text('Hangman',style: kHeadingTextStyle,),
                        SizedBox(height: 40,),
                        ImageWidget(
                          imagePath: 'images/6.jpg',
                        ),
                      ],
                    )
                  ),
                  Flexible(
                    flex:3,
                    child: Column(
                      children: [
                       // SizedBox(height:100),
                        ButtonWidget(
                          title: 'Start',
                          onPressed: (){
                            Navigator.pushNamed(context, GameScreen.id);
                          },
                        ),
                        SizedBox(height: 15,),
                        ButtonWidget(
                          title: 'High Score',
                          onPressed: (){
                            Navigator.pushNamed(context, LoadingScreen.id);
                          },
                        ),
                      ],
                    ),
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
