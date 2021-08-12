import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String email, String password, bool isManager) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'email': email, // John Doe
          'password': password, // Stokes and Sons
          'isManager': isManager // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> checkLogin(String email, String password, bool isManager) {
    // Call the user's CollectionReference to add a new user
    return users
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .where('isManager', isEqualTo: isManager)
        .get()
        .then((value) => print(value.docs.first['email']))
        .catchError((error) => print("Failed to check: $error"));
  }
}
