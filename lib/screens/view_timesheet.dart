import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/manager/home_screen.dart';
class ViewTimesheetScreen extends StatefulWidget {
  const ViewTimesheetScreen({Key? key}) : super(key: key);

  @override
  _ViewTimesheetScreenState createState() => _ViewTimesheetScreenState();
}

class _ViewTimesheetScreenState extends State<ViewTimesheetScreen> {
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
              color: appdarkColor,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen())),
                          child: Icon(Icons.home,size: 40,color: Colors.blue,)),
                      Text("View Timesheet",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: Container(
                      color: applightColor,
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          labelText: "Search",
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
