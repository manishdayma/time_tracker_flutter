import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String userid, String email, String password,
      bool isManager, String name, String emp) {
    // Call the user's CollectionReference to add a new user
    return users.doc(userid).set({
      'uid': userid,
      'email': email, // John Doe
      'password': password, // Stokes and Sons
      'isManager': isManager,
      'name': name,
      "emp_id": emp // 42
    }).then((value) {
      Fluttertoast.showToast(msg: "user created please login");
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
