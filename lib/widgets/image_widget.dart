import 'package:flutter/material.dart';
class ImageWidget extends StatelessWidget {

  ImageWidget({this.imagePath});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: TweenAnimationBuilder(
        tween:ColorTween(begin: Colors.white24,end:Colors.white) ,
        duration: Duration(seconds: 3),
        builder: (_,color,__){
          return ColorFiltered(
              colorFilter: ColorFilter.mode(color,BlendMode.modulate),
              child: Image.asset(
                imagePath,
                height: 300,
                fit: BoxFit.contain,
              ),
          );
        }
      ),
    );
  }
}
