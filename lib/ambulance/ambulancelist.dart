import 'package:amber/services/auth_service.dart';
import 'package:flutter/material.dart';

class AList extends StatefulWidget {
  @override
  _AListState createState() => _AListState();
}

class _AListState extends State<AList> {
  final AuthService _auth = AuthService();
  List<int> itemState = [0, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Container(height: 60, child: Image.asset("assets/logo.png")),
        centerTitle: true,
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person, color: Colors.orange[300], size: 30),
              label: Text('logout',
                  style: TextStyle(color: Colors.white, fontSize: 16)))
        ],
        leading: Icon(Icons.menu, color: Colors.orange[300]),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          margin: EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        itemState[0] == 0 ? itemState[0] = 1 : itemState[0] = 0;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kathmandu",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.white, size: 35),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemState[0] == 1
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 25,
                                    padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                    color: Colors.grey[400],
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Pulchok 001"),
                                          Container(
                                            width: 15,
                                            height: 15,
                                            color: Colors.green,
                                          )
                                        ]),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Kalanki 046"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.red,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Kuleshwor 026"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Balkhu 011"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ))
                      : SizedBox(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        itemState[1] == 0 ? itemState[1] = 1 : itemState[1] = 0;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Banaepa",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.white, size: 35),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemState[1] == 1
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Teendobato 001"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.red,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Chardobato 046"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.red,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Ekdobato 026"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Dodobato 011"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ))
                      : SizedBox(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        itemState[2] == 0 ? itemState[2] = 1 : itemState[2] = 0;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dhulikhel",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.white, size: 35),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemState[2] == 1
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Pulchok 001"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.red,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Kalanki 046"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Kuleshwor 026"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.red,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Balkhu 011"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ))
                      : SizedBox(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        itemState[3] == 0 ? itemState[3] = 1 : itemState[3] = 0;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Panauti",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.white, size: 35),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemState[3] == 1
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Pulchok 001"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Kalanki 046"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.red,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Kuleshwor 026"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.green,
                                        )
                                      ]),
                                ),
                                Container(
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(5, 2, 2, 2),
                                  color: Colors.grey[400],
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Balkhu 011"),
                                        Container(
                                          width: 15,
                                          height: 15,
                                          color: Colors.red,
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ))
                      : SizedBox(),
                ],
              ),
            ),
          )),
    );
  }
}
