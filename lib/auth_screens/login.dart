import 'package:amber/auth_screens/loginform.dart';
import 'package:amber/auth_screens/signupform.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Color> color = [
    Color(0xfff4a925),
    Colors.grey,
    Colors.white,
    Colors.black
  ];
  List<double> size = [0.4, 0.3];
  bool login = true;
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).viewInsets.bottom == 0.0 ? 0.3 : 0.02;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[800],
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(height: 20),
        Image.asset(
          "assets/logo.png",
          height: 150,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * height),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  width: MediaQuery.of(context).size.width * size[0],
                  decoration: BoxDecoration(
                      color: color[0], borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          login = true;
                          size[0] = 0.4;
                          size[1] = 0.3;
                          color[0] = Color(0xfff4a925);
                          color[1] = Colors.grey;
                          color[2] = Colors.white;
                          color[3] = Colors.black;
                        });
                      },
                      child: Text("Login",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 50 * size[0],
                              color: color[3])))),
              AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  width: MediaQuery.of(context).size.width * size[1],
                  decoration: BoxDecoration(
                      color: color[1], borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          login = false;
                          size[0] = 0.3;
                          size[1] = 0.4;
                          color[0] = Colors.grey;
                          color[1] = Color(0xfff4a925);
                          color[2] = Colors.black;
                          color[3] = Colors.white;
                        });
                      },
                      child: Text("SignUp",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 50 * size[1],
                              color: color[2]))))
            ])),
        SizedBox(height: 10),
        login ? LoginForm() : SignUpForm()
      ]),
    );
  }
}
