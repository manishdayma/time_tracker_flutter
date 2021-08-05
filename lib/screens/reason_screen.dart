import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/add_timesheet_screen.dart';

class ReasonScreen extends StatefulWidget {
  const ReasonScreen({Key? key}) : super(key: key);

  @override
  _ReasonScreenState createState() => _ReasonScreenState();
}

class _ReasonScreenState extends State<ReasonScreen> {

  @override
  Widget build(BuildContext context) {
    Size _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: _mediaQuery.height,
            color: applightColor,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: appdarkColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "Reason",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            TextField(
                              keyboardType: TextInputType.multiline,
                              maxLength: null,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  icon: Icon(Icons
                                      .local_fire_department), //icon of text field
                                  labelText:
                                  "Write Reason here" //label text of field
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              child: Text(" Submit ",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.all(20)),
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      appdarkColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: appdarkColor),
                                      ))),
                              onPressed: () => {
                                Navigator.pop(context),
                              },
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
