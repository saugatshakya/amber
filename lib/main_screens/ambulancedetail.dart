import 'package:amber/model/ambulance.dart';
import 'package:flutter/material.dart';

class Adetail extends StatelessWidget {
  final Ambulance ambulance;
  const Adetail({Key key, @required this.ambulance}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(ambulance.driverName));
  }
}
