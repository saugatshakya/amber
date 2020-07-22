import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xff131111),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/loading.gif"),
        TypewriterAnimatedTextKit(
            speed: Duration(milliseconds: 500),
            repeatForever: true,
            text: ["Loading", "Please Be Patient"],
            textStyle: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                decoration: TextDecoration.none,
                letterSpacing: 2,
                backgroundColor: Colors.red[800]),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart)
      ]),
    );
  }
}
