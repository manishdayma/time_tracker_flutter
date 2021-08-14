import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/home_screen2.dart';
import 'package:time_tracker/screens/manager/home_screen.dart';
import 'package:time_tracker/screens/signup_screen.dart';
import 'package:time_tracker/services/firestore_services.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatefulWidget {
  final bool ismanager;
  const LoginScreen({Key? key, required this.ismanager}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var uuid = Uuid();
  bool _obscureText = true;
  bool _validate = false;
  FirestoreService _firestoreService = FirestoreService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: _mediaQuery.height,
          child: SingleChildScrollView(
            child: Container(
              height: _mediaQuery.height,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: appdarkColor,
                    child: Center(
                      child: Image.asset(
                        'assets/images/GC5-imtac.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: _mediaQuery.height * 0.1, horizontal: 50),
                      color: applightColor,
                      child: Column(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: email,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "Username",
                              errorText:
                                  _validate ? 'Value Can\'t Be Empty' : null,
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextField(
                            controller: password,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "Password",
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: _toggle,
                              ),
                            ),
                            obscureText: _obscureText,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              gotosignup();
                            },
                            child: Text(
                              "don't have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.2,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextButton(
                              child: Text("Login",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(15)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          appdarkColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: appdarkColor),
                                  ))),
                              onPressed: () {
                                if (email.text.isEmpty ||
                                    password.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Please enter username and password")));
                                } else {
                                  checkLogin();
                                }
                              }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin() {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email.text)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      print(querySnapshot.docs.length);
      if (querySnapshot.docs.length == 0) {
        Fluttertoast.showToast(msg: "Please Signup");
      } else {
        querySnapshot.docs.forEach((doc) async {
          print(doc.reference.id);
          if (doc['password'] == password.text) {
            print("login" + doc['isManager'].toString());
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool("isLogin", true);
            await prefs.setString("user", doc['uid']);
            await prefs.setString("email", doc['email']);
            await prefs.setBool("isManager", doc['isManager']);
            doc['isManager'] == true
                ? Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()))
                : Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen2()));
          } else {
            Fluttertoast.showToast(msg: "wrong password");
          }
        });
      }
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  void gotosignup() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
  }
}
