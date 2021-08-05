import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/manager/analytics_screen.dart';
import 'package:time_tracker/screens/manager/approved_timesheet.dart';
import 'package:time_tracker/screens/manager/home_screen.dart';
import 'package:time_tracker/screens/weeklylog_screen.dart';

import 'manager/approve_timesheet.dart';

class TimesheetScreen extends StatefulWidget {
  const TimesheetScreen({Key? key}) : super(key: key);

  @override
  _TimesheetScreenState createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen())),
                      child: Icon(
                        Icons.home,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                    Center(
                      widthFactor: 3,
                      child: Text(
                      "Timesheet",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                    ),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.check_box),
                      title: Text(
                          'JUNE 2021 - FOURTH WEEK ( 25/07/2021 - 31/07/2021 )'),
                      trailing: Icon(Icons.delete),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AnalyticsScreen()));
                      },
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: FloatingActionButton(
                          heroTag: "btn1",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => WeeklyLogScreen()));
                          },
                          child: Icon(Icons.add),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        ApproveTimesheetScreen()));
                          },
                          child: Icon(Icons.navigate_next),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
