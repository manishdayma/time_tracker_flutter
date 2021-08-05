import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/approve_decline_screen.dart';
import 'package:time_tracker/screens/manager/home_screen.dart';
class ApproveTimesheetScreen extends StatefulWidget {
  const   ApproveTimesheetScreen({Key? key}) : super(key: key);

  @override
  _ApproveTimesheetScreenState createState() => _ApproveTimesheetScreenState();
}

class _ApproveTimesheetScreenState extends State<ApproveTimesheetScreen> {
  @override
  Widget build(BuildContext context) {
    Size _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: _mediaQuery.height,
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
                      onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen())),
                      child: Icon(Icons.home,size: 40,color: Colors.blue,),
                    ),
                    Text("Approve Timesheet",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.check_box),
                      title: Text('JUNE 2021 - FOURTH WEEK ( 25/07/2021 - 31/07/2021 )',style: TextStyle(fontSize: 14,color: Colors.blue),),
                      onTap: (){
                        //Navigator.of(context).pushNamed("your_route_name");
                      } ,
                    ),Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Icon(Icons.check_box),
                      title: Text('JUNE 2021 - FOURTH WEEK ( 25/07/2021 - 31/07/2021 )',style: TextStyle(fontSize: 14,color: Colors.blue),),
                      onTap: (){
                        //Navigator.of(context).pushNamed("your_route_name");
                      } ,
                    ),Divider(
                      thickness: 1,
                    ),
                  ],
                )),
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: FloatingActionButton( onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ApproveDeclineScreen()));
                        },
                          child: Icon(Icons.navigate_next),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
