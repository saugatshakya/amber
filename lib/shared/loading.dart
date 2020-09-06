import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 5),
        () => Navigator.popAndPushNamed(context, "Wrapper"));
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xff131111),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/logo.png"),
        SizedBox(height: 100),
        TypewriterAnimatedTextKit(
            speed: Duration(milliseconds: 1000),
            repeatForever: true,
            text: [". ", ". . ", ". . . ", ". . . . "],
            textStyle: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              decoration: TextDecoration.none,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart)
      ]),
    );
  }
}
