import 'package:amber/model/emergency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Emergencyform extends StatefulWidget {
  @override
  _EmergencyformState createState() => _EmergencyformState();
}

class _EmergencyformState extends State<Emergencyform> {
  final _formKey = GlobalKey<FormState>();
  String hospitalname = "",
      hospital = "",
      name = "unidentified",
      age = "undetermined",
      sex = "optional",
      bloodGroup = "optional",
      guardianContact = "",
      emergency = "Choose an Emergency",
      requireddepart;
  List sexlist = ["male", "female"];
  List bloodgrouplist = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  List emergencylist = [
    "Cuts by object",
    "Fire Burn",
    "Head Injury",
    "Road Hit",
    "Vehicle Accident",
    "Machinery Accident",
    "Cardiac Arrest",
    "Sudden fanting",
    "Maternity realted",
    "Children accident"
  ];
  bool expand1 = false,
      expand2 = false,
      expand3 = false,
      loading = false,
      sent = false;
  double hei = 200;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width * 0.95,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Name:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          onChanged: (input) => name = input,
                          decoration: new InputDecoration(
                            hintText: "Optional",
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          keyboardType: TextInputType.name,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Sex:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (expand1 == true) {
                              expand1 = false;
                            } else {
                              expand1 = true;
                            }
                          });
                        },
                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black, width: 0.8)),
                              constraints: BoxConstraints(maxWidth: 500),
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                    Expanded(
                                        child: Text(
                                      sex,
                                      style: TextStyle(fontSize: 14),
                                    )),
                                    Icon(expand1
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ]))),
                          expand1
                              ? SingleChildScrollView(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 500),
                                    height: 55,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: ListView.builder(
                                        itemCount: sexlist.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                sex = sexlist[index];
                                                expand1 = false;
                                              });
                                            },
                                            child: Container(
                                              height: 20,
                                              margin: EdgeInsets.all(1),
                                              color: Colors.grey[100],
                                              child: Center(
                                                child: Text(
                                                  sexlist[index],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                )
                              : SizedBox()
                        ]),
                      )
                    ]),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Age:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 500),
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (input) => age = input,
                          decoration: new InputDecoration(
                            hintText: "Optional",
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Blood Group:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (expand2 == true) {
                              expand2 = false;
                            } else {
                              expand2 = true;
                            }
                          });
                        },
                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black, width: 0.8)),
                              constraints: BoxConstraints(maxWidth: 500),
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                    Expanded(
                                        child: Text(
                                      bloodGroup,
                                      style: TextStyle(fontSize: 14),
                                    )),
                                    Icon(expand2
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ]))),
                          expand2
                              ? SingleChildScrollView(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: 500),
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: ListView.builder(
                                        itemCount: bloodgrouplist.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                bloodGroup =
                                                    bloodgrouplist[index];
                                                expand2 = false;
                                              });
                                            },
                                            child: Container(
                                              height: 20,
                                              margin: EdgeInsets.all(1),
                                              color: Colors.grey[100],
                                              child: Center(
                                                child: Text(
                                                  bloodgrouplist[index],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                )
                              : SizedBox()
                        ]),
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "*Guardian Contact no:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 12),
                  constraints: BoxConstraints(maxWidth: 500),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    //checks if the field is empty or not
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Provide a valid number';
                      } else
                        return null;
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (input) => guardianContact = input,
                    decoration: new InputDecoration(
                      hintText: "Required",
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "*Emergency:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (expand3 == true) {
                          expand3 = false;
                        } else {
                          expand3 = true;
                        }
                      });
                    },
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.black, width: 0.8)),
                          constraints: BoxConstraints(maxWidth: 500),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Center(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                Expanded(
                                    child: Text(
                                  emergency,
                                  style: TextStyle(fontSize: 14),
                                )),
                                Icon(expand3
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down)
                              ]))),
                      expand3
                          ? SingleChildScrollView(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                height: 220,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: ListView.builder(
                                    itemCount: emergencylist.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            emergency = emergencylist[index];
                                            expand3 = false;
                                          });
                                        },
                                        child: Container(
                                          height: 20,
                                          margin: EdgeInsets.all(1),
                                          color: Colors.grey[100],
                                          child: Center(
                                            child: Text(
                                              emergencylist[index],
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            )
                          : SizedBox(),
                      SizedBox(height: 16),
                      hospital == ""
                          ? loading
                              ? CircularProgressIndicator()
                              : GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    QuerySnapshot snapshot = await Firestore
                                        .instance
                                        .collection('hospital')
                                        .getDocuments();
                                    if (emergency == "Fire Burn" ||
                                        emergency == "Cuts by object") {
                                      setState(() {
                                        requireddepart = "Plastic Surgery";
                                      });
                                    }
                                    if (emergency == "Cardiac Arrest" ||
                                        emergency == "Sudden fanting") {
                                      setState(() {
                                        requireddepart = "Cardiomedicine";
                                      });
                                    }
                                    if (emergency == "Road Hit" ||
                                        emergency == "Vehicle Accident") {
                                      setState(() {
                                        requireddepart = "Orthopedics";
                                      });
                                    }
                                    if (emergency == "Maternity") {
                                      setState(() {
                                        requireddepart =
                                            "Obstetrics and Gynaecology";
                                      });
                                    }
                                    if (emergency == "Children accident") {
                                      setState(() {
                                        requireddepart = "Pediatrics";
                                      });
                                    }
                                    for (int i = 0;
                                        i < snapshot.documents.length;
                                        i++) {
                                      var hospitaldata =
                                          snapshot.documents[i].data;
                                      for (int j = 0;
                                          j < hospitaldata['ambulance'].length;
                                          j++) {
                                        if (hospitaldata['ambulance'][j]
                                                ['active'] ==
                                            "true") {
                                          for (int k = 0;
                                              k <
                                                  hospitaldata['departments']
                                                      .length;
                                              k++) {
                                            if (hospitaldata['departments'][k]
                                                    ['name'] ==
                                                requireddepart) {
                                              for (int l = 0;
                                                  l <
                                                      hospitaldata['doctors']
                                                          .length;
                                                  l++) {
                                                print(hospitaldata['doctors'][l]
                                                    ['name']);
                                                if (hospitaldata['doctors'][l]
                                                            ['department'] ==
                                                        requireddepart &&
                                                    hospitaldata['doctors'][l]
                                                            ['state'] ==
                                                        "active") {
                                                  setState(() {
                                                    hospital = snapshot
                                                        .documents[i]
                                                        .documentID;
                                                    hospitalname =
                                                        hospitaldata['name'];
                                                  });
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(8),
                                      constraints:
                                          BoxConstraints(maxWidth: 500),
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.32,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[800],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.save, color: Colors.white),
                                          SizedBox(width: 20),
                                          Text("Find Hospital",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ))
                                        ],
                                      )),
                                )
                          : sent
                              ? Text("Ambulance is Arriving from")
                              : GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState.validate()) {
                                      Emergency patient = Emergency(
                                          name: name,
                                          guardianContact: guardianContact,
                                          sex: sex,
                                          age: age,
                                          bloodgroup: bloodGroup,
                                          emergency: emergency);
                                      await Firestore.instance
                                          .collection("hospital")
                                          .document(hospital)
                                          .updateData({
                                        "notification": FieldValue.arrayUnion(
                                            [patient.toJson()])
                                      });
                                      setState(() {
                                        sent = true;
                                      });
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(8),
                                      constraints:
                                          BoxConstraints(maxWidth: 500),
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.32,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[800],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.save, color: Colors.white),
                                          SizedBox(width: 20),
                                          Text("Send",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ))
                                        ],
                                      )),
                                ),
                      Text(hospitalname)
                    ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
