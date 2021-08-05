import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/manager/approve_timesheet.dart';
import 'package:time_tracker/screens/manager/approved_timesheet.dart';

class ApproveDeclineScreen extends StatefulWidget {
  const ApproveDeclineScreen({Key? key}) : super(key: key);

  @override
  _ApproveDeclineScreenState createState() => _ApproveDeclineScreenState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class _ApproveDeclineScreenState extends State<ApproveDeclineScreen> {
  BestTutorSite _site = BestTutorSite.javatpoint;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ApprovedTimesheetScreen()));
            },
            child: Icon(Icons.navigate_next),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text("Send To"),
          ),
      body: Container(
        color: appdarkColor,
        child: Column(
          children: [
            ListTile(
              title: const Text('Approve'),
              leading: Radio(
                value: BestTutorSite.javatpoint,
                groupValue: _site,
                onChanged: (BestTutorSite? value) {
                  _site = value!;
                  setState(() {

                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Reject'),
              leading: Radio(
                value: BestTutorSite.tutorialandexample,
                groupValue: _site,
                onChanged: (BestTutorSite? value) {
                  _site = value!;
                  setState(() {

                  });
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
