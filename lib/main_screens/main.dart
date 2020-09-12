import 'dart:collection';
import 'package:amber/main_screens/emergency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:amber/services/auth_service.dart';
import 'package:flutter/rendering.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:amber/model/user.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  LocationData _locationData;
  Location location = new Location();

  void _setMapStyle() async {
    String style =
        await DefaultAssetBundle.of(context).loadString('assets/mapstyle.json');
    _mapController.setMapStyle(style);
  }

  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    _setMapStyle();
    QuerySnapshot snapshot =
        await Firestore.instance.collection('hospital').getDocuments();
    for (int i = 0; i < snapshot.documents.length; i++) {
      var hospitaldata = snapshot.documents[i].data;
      String name = hospitaldata['name'];
      var addresses = await Geocoder.local.findAddressesFromQuery(name);
      var location = addresses.first.coordinates;
      _markers.add(Marker(
          onTap: () {
            showDialog(
                context: context,
                builder: (ctxt) =>
                    AlertDialog(title: Text(hospitaldata['name'])));
          },
          markerId: MarkerId(i.toString()),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(
              title: hospitaldata['name'], snippet: hospitaldata['location'])));
    }
  }

  final AuthService _auth = AuthService();
  //initialize the pressed with false to show the ambulance page
  String searchAddr = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    //find the current user
    final user = Provider.of<User>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            ]),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctxt) => AlertDialog(
                        title: Text("Emergency"),
                        content: Emergencyform(),
                      ));
            },
            child: Icon(Icons.add, color: Color(0xfff4a925), size: 30),
            backgroundColor: Colors.grey[800],
            elevation: 5,
            hoverColor: Colors.grey[200],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: Stack(children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition:
                CameraPosition(target: LatLng(26.8123, 87.2683), zoom: 15),
            markers: _markers,
            myLocationEnabled: true,
          ),
          loading
              ? Center(
                  child: Container(
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation(Color(0xfff4a925)))))
              : Container(),
          Positioned(
              top: 20,
              left: 4,
              right: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.8,
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xfff4a925)),
                          child: TextField(
                            maxLines: 1,
                            cursorColor: Colors.grey[800],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.grey[800],
                                letterSpacing: 2),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                              hintText: "Enter Address",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.grey[800],
                                  letterSpacing: 2),
                              border: InputBorder.none,
                            ),
                            onChanged: (val) {
                              setState(() {
                                searchAddr = val;
                              });
                            },
                            onEditingComplete: () {
                              FocusManager.instance.primaryFocus.unfocus();
                            },
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            icon: Icon(Icons.search,
                                size: 30, color: Color(0xfff4a925)),
                            onPressed: () async {
                              FocusManager.instance.primaryFocus.unfocus();
                              setState(() {
                                loading = true;
                              });
                              var addresses = await Geocoder.local
                                  .findAddressesFromQuery(searchAddr);
                              var first = addresses.first.coordinates;
                              _mapController.animateCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: LatLng(
                                          first.latitude, first.longitude),
                                      zoom: 15.5)));
                              setState(() {
                                loading = false;
                              });
                            }),
                      ),
                    ]),
              )),
          Positioned(
              bottom: 40,
              height: 60,
              width: 60,
              left: MediaQuery.of(context).size.width * 0.45,
              child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.my_location,
                      color: Color(0xfff4a925),
                      size: 40,
                    ),
                  ),
                  onTap: () async {
                    _locationData = await location.getLocation();
                    print(_locationData);
                    _mapController.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: LatLng(_locationData.latitude,
                                _locationData.longitude),
                            zoom: 15.5)));
                  }))
        ]));
  }
}
