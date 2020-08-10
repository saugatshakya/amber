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
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseApp app = FirebaseApp(
    options: FirebaseOptions(
  googleAppID: '1:329001543546:android:b0abd8a500d653c0c718c3',
  apiKey: 'AIzaSyDqh058hJJ209H0h7rQu8rssGmI3HR_YTU',
  databaseURL: 'https://amber-8776e.firebaseio.com' ,   
    )); //Firebaseoptions //firebaseapp

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
          home: Wrapper()),
    );
  }
}

class Item {
  String key;
  String title;
  String body;

  Item(this.title, this.body);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        body = snapshot.value["body"];

  toJson() {
    return {
      "title": title,
      "body": body,
    };
  }      
}