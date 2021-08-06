import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/add_timesheet_screen.dart';

class AddCSOScreen extends StatefulWidget {
  const AddCSOScreen({Key? key}) : super(key: key);

  @override
  _AddCSOScreenState createState() => _AddCSOScreenState();
}

class _AddCSOScreenState extends State<AddCSOScreen> {
  final dateController = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController timeinput2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                      "CSO",
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: TextField(
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: 'CSO No.',
                                icon: Icon(Icons.calendar_today_outlined),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 5,
                            child: TextField(
                              readOnly: true,
                              controller: dateController,
                              decoration: InputDecoration(
                                hintText: 'Pick your Date',
                                icon: Icon(Icons.calendar_today_outlined),
                              ),
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                dateController.text =
                                    date.toString().substring(0, 10);
                              },
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20,),
                      Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child:TextField(
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: 'Email ID',
                                icon: Icon(Icons.email_sharp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 5,
                            child: TextField(
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                icon: Icon(Icons.person),
                              ),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20,),
                      Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: TextField(
                              readOnly: true,
                              controller: dateController,
                              decoration: InputDecoration(
                                hintText: 'Reported on',
                                icon: Icon(Icons.calendar_today_outlined),
                              ),
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2100));
                                dateController.text =
                                    date.toString().substring(0, 10);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 5,
                            child: TextField(
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: 'Mobile No.',
                                icon: Icon(Icons.phone_android),
                              ),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20,),
                      Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child:   Container(
//margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0, style: BorderStyle.solid),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                dropdownColor: appdarkColor,
                                items: <String>[
                                  'contract 1',
                                  'contract 2',
                                  'contract 3'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                                isExpanded: true,
                                hint: Text(" Select contract"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 5,
                            child:  TextField(
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: 'Engineer',
                                icon: Icon(Icons.school),
                              ),
                            ),

                          ),
                        ],
                      ),SizedBox(height: 20,),
                      Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: TextField(
                              controller:
                              timeinput, //editing controller of this TextField
                              decoration: InputDecoration(
                                  icon: Icon(Icons.timer), //icon of text field
                                  labelText: "Start Time" //label text of field
                              ),
                              readOnly:
                              true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if (pickedTime != null) {
                                  print(
                                      pickedTime.format(context)); //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm()
                                      .parse(pickedTime.format(context).toString());
//converting to DateTime so that we can further format on different pattern.
                                  print(
                                      parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime =
                                  DateFormat('HH:mm:ss').format(parsedTime);
                                  print(formattedTime); //output 14:59:00
//DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    timeinput.text =
                                        formattedTime; //set the value of text field.
                                  });
                                } else {
                                  print("Time is not selected");
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 5,
                            child: TextField(
                              controller:
                              timeinput, //editing controller of this TextField
                              decoration: InputDecoration(
                                  icon: Icon(Icons.timer), //icon of text field
                                  labelText: "End Time" //label text of field
                              ),
                              readOnly:
                              true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if (pickedTime != null) {
                                  print(
                                      pickedTime.format(context)); //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm()
                                      .parse(pickedTime.format(context).toString());
//converting to DateTime so that we can further format on different pattern.
                                  print(
                                      parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime =
                                  DateFormat('HH:mm:ss').format(parsedTime);
                                  print(formattedTime); //output 14:59:00
//DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    timeinput.text =
                                        formattedTime; //set the value of text field.
                                  });
                                } else {
                                  print("Time is not selected");
                                }
                              },
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20,),
                      Row(
                        children: [
                          Flexible(
                            flex: 5,
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLength: null,
                              maxLines: 2,
                              decoration: InputDecoration(
                                  icon:
                                  Icon(Icons.text_snippet), //icon of text field
                                  labelText:
                                  "Desciption" //label text of field
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 5,
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLength: null,
                              maxLines: 2,
                              decoration: InputDecoration(
                                  icon:
                                  Icon(Icons.text_snippet), //icon of text field
                                  labelText:
                                  "Resolution" //label text of field
                              ),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 20,),
                      SizedBox(height: 20,),
                      TextButton(
                        child: Text(" Add ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(20)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(appdarkColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: appdarkColor),
                            ))),
                        onPressed: () => {
                          Navigator.pop(context),
                        },
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
