import 'package:amber/main_screens/ambulancelist.dart';
import 'package:amber/main_screens/medicine.dart';
import 'package:flutter/material.dart';
import 'package:amber/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:amber/model/user.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final AuthService _auth = AuthService();
  //initialize the pressed with false to show the ambulance page
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    //find the current user
    final user = Provider.of<User>(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            backgroundColor: Colors.grey[800],
            title: Container(height: 60, child: Image.asset("assets/logo.png")),
            centerTitle: true,
            actions: [
              FlatButton.icon(
                  onPressed: () async {
                    //if user is not null signout or else pop and go to welcome screen
                    if (user == null) {
                      Navigator.popAndPushNamed(context, "Welcome");
                    } else
                      await _auth.signOut();
                  },
                  icon: Icon(Icons.person, color: Color(0xfff4a925), size: 30),
                  label: Text('logout',
                      style: TextStyle(color: Colors.white, fontSize: 16)))
            ],
            leading: IconButton(
                //show icon according to state of pressed
                icon: Icon(
                  pressed
                      ? Icons.keyboard_arrow_left
                      : Icons.keyboard_arrow_right,
                  color: Color(0xfff4a925),
                ),
                onPressed: () {
                  //change the state of pressed
                  setState(() {
                    pressed ? pressed = false : pressed = true;
                  });
                })),
        body: Stack(
          children: [
            //ambulance page if pressed is false and medicine page is pressed is true
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: pressed ? 0 : MediaQuery.of(context).size.width,
              child: Positioned(
                  left: pressed ? MediaQuery.of(context).size.width : 0.0,
                  child: AList()),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: pressed ? MediaQuery.of(context).size.width : 0,
              child: Positioned(
                  left: pressed ? 0.0 : MediaQuery.of(context).size.width,
                  child: MedicineList()),
            ),
          ],
        ));
  }
}
