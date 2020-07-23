import 'package:amber/model/ambulance.dart';
import 'package:flutter/material.dart';
import 'package:amber/services/auth_service.dart';
import 'package:amber/model/user.dart';
import 'package:provider/provider.dart';

class Adetail extends StatelessWidget {
  //take an ambulance from the list of ambulances
  final Ambulance ambulance;
  Adetail({Key key, @required this.ambulance}) : super(key: key);
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            backgroundColor: Colors.grey[800],
            title: Container(height: 60, child: Image.asset("assets/logo.png")),
            centerTitle: true,
            actions: [
              FlatButton.icon(
                  //check if user is logged in and either logout or pop the screen and push welcome screen
                  onPressed: () async {
                    if (user == null) {
                      Navigator.popAndPushNamed(context, "Welcome");
                    } else
                      await _auth.signOut();
                  },
                  icon: Icon(Icons.person, color: Colors.orange[300], size: 30),
                  label: Text('logout',
                      style: TextStyle(color: Colors.white, fontSize: 16)))
            ],
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  //go back to main screen
                  Navigator.pop(context);
                })),
        //show the detail of the ambulance
        body: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ambulance No: " + ambulance.location + "" + ambulance.id,
                    style: TextStyle(fontSize: 28, color: Colors.white)),
                SizedBox(height: 10),
                Text("Location: " + ambulance.location,
                    style: TextStyle(fontSize: 28, color: Colors.white)),
                SizedBox(height: 80),
                Text(ambulance.driverName,
                    style: TextStyle(fontSize: 28, color: Colors.white)),
                SizedBox(height: 10),
                Text(ambulance.number,
                    style: TextStyle(fontSize: 28, color: Colors.white)),
                SizedBox(height: 50),
                GestureDetector(
                  //call the amulance
                  onTap: () {},
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xfff4a925)),
                    child: Center(
                      child: Text(
                        "Hire",
                        style: TextStyle(fontSize: 40, color: Colors.grey[800]),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
