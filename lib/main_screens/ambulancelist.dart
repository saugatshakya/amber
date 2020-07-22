import 'package:amber/data/ambulance.dart';
import 'package:amber/main_screens/ambulancedetail.dart';
import 'package:flutter/material.dart';

class AList extends StatefulWidget {
  @override
  _AListState createState() => _AListState();
}

class _AListState extends State<AList> {
  List<int> itemState = [0, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
        child: ListView.builder(
          itemCount: ambulance.length,
          itemBuilder: (context, index) {
            return Column(children: [
              ExpansionTile(
                childrenPadding: EdgeInsets.all(5),
                tilePadding: EdgeInsets.all(5),
                title: Center(
                    child: Text(
                  ambulance[index].location,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Adetail(
                                ambulance: ambulance[index],
                              )));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                ambulance[index].location +
                                    " " +
                                    ambulance[index].id,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                          Container(
                              width: 10,
                              height: 10,
                              color: (index * 2) % 3 == 1
                                  ? Colors.red
                                  : Colors.green)
                        ]),
                  )
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Divider(color: Colors.white, thickness: 1))
            ]);
          },
        ));
  }
}
