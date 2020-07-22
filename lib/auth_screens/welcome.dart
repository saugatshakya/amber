import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[800],
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/logo.png",
            height: 150,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.5),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xfff4a925),
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width - 30,
              child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Login");
                  },
                  child: Text("Login / SignUp",
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.white)))),
          SizedBox(height: 10),
          FlatButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "AmbulanceList");
            },
            child: Text("Sign In Anonomously",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none)),
          )
        ]));
  }
}
