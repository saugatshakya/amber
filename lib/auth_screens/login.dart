import 'package:amber/auth_screens/loginform.dart';
import 'package:amber/auth_screens/signupform.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //holds color for the signin and login bar
  List<Color> color = [
    Color(0xfff4a925),
    Colors.grey,
    Colors.black,
    Colors.white
  ];
  //holds size ratio of signin and login cont
  List<double> size = [0.5, 0.2];
  //holds the state of either login or signup is enabled
  bool login = true;
  @override
  Widget build(BuildContext context) {
    //when the keyboard appers reduce the empty space for better visibility
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
        //cont that handles the state of login or signup
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              //cont that changes the val of login to true on pressed
              AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  width: MediaQuery.of(context).size.width * size[0],
                  decoration: BoxDecoration(
                      color: color[0], borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          // changing the state and the colors and size of login and signup cont button
                          login = true;
                          size[0] = 0.5;
                          size[1] = 0.2;
                          color[0] = Color(0xfff4a925);
                          color[1] = Colors.grey;
                          color[2] = Colors.black;
                          color[3] = Colors.white;
                        });
                      },
                      child: Text("Login",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 55 * size[0],
                              color: color[3])))),
              //cont that changes the val of login to false when pressed
              AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  width: MediaQuery.of(context).size.width * size[1],
                  decoration: BoxDecoration(
                      color: color[1], borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          // changing the state and the colors and size of login and signup cont button
                          login = false;
                          size[0] = 0.2;
                          size[1] = 0.5;
                          color[0] = Colors.grey;
                          color[1] = Color(0xfff4a925);
                          color[2] = Colors.white;
                          color[3] = Colors.black;
                        });
                      },
                      child: Text("SignUp",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 55 * size[1],
                              color: color[2]))))
            ])),
        SizedBox(height: 10),
        //shows login or signup form after checing the state of login
        login ? LoginForm() : SignUpForm()
      ]),
    );
  }
}
