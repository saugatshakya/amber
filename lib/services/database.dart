import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amber/model/hospital.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection
  final CollectionReference hospitalCollection =
      Firestore.instance.collection('hospital');
  final CollectionReference userCollection =
      Firestore.instance.collection('user');

  Future changeUserData(String name, String email, String number) async {
    return await userCollection
        .document(uid)
        .setData({'name': name, 'email': email, 'number': number});
  }

  Stream<Hospital> get hospitalData {
    return hospitalCollection
        .document(uid)
        .snapshots()
        .map(_hospitalDataFromSnapshot);
  }

  Hospital _hospitalDataFromSnapshot(DocumentSnapshot snapshot) {
    return Hospital(
        name: snapshot.data['name'],
        location: snapshot.data['location'],
        doctors: snapshot.data['doctors'],
        departments: snapshot.data['departments'],
        wards: snapshot.data['wards'],
        ambulance: snapshot.data['ambulance'],
        notificaton: snapshot.data['notification']);
  }
}
