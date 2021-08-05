import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/login_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: applightColor,
          height: _mediaQuery.height,
          child: Container(
            height: _mediaQuery.height,
            child: Column(
              children: [
                SizedBox(height: 100,),
                Center(
                  child: CircleAvatar(child: Icon(Icons.person,size: 50,),radius: 50,),
                ),
                SizedBox(height: 10,),
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                SizedBox(height: 10,),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                SizedBox(height: 100,),
                TextButton(
                    child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        backgroundColor: MaterialStateProperty.all<Color>(appdarkColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: appdarkColor),
                            )
                        )
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen(ismanager: true,)))
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
