import 'package:amber/main_screens/ambulancelist.dart';
import 'package:amber/auth_screens/login.dart';
import 'package:amber/auth_screens/wrapper.dart';
import 'package:amber/main_screens/main.dart';
import 'package:amber/services/auth_service.dart';
import 'package:amber/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:amber/auth_screens/welcome.dart';
import 'package:provider/provider.dart';
import 'package:amber/model/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "Welcome": (context) => Welcome(),
            "Login": (context) => Login(),
            "AmbulanceList": (context) => AList(),
            "Wrapper": (context) => Wrapper(),
            "Loading": (context) => Loading(),
            "Main": (context) => Main()
          },
          home: Loading()),
    );
  }
}
