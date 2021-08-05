import 'package:flutter/material.dart';
class abc extends StatefulWidget {
  const abc({Key? key}) : super(key: key);

  @override
  _abcState createState() => _abcState();
}

class _abcState extends State<abc> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                readOnly: false,
                decoration: InputDecoration(
                  hintText: 'CSO No.',
                  icon: Icon(Icons.calendar_today_outlined),
                ),
              ),

              TextField(
                readOnly: false,
                decoration: InputDecoration(
                  hintText: 'Email ID',
                  icon: Icon(Icons.email_sharp),
                ),
              ),
              TextField(
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
              Container(
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
              TextField(
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
              ),TextField(
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
              TextField(
                keyboardType: TextInputType.multiline,
                maxLength: null,
                maxLines: 2,
                decoration: InputDecoration(
                    icon:
                    Icon(Icons.text_snippet), //icon of text field
                    labelText:
                    "Write Desciption here" //label text of field
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20,),
        Flexible(
          flex: 5,
          child: Column(
            children: [
              TextField(
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

              TextField(
                readOnly: false,
                decoration: InputDecoration(
                  hintText: 'Customer Name',
                  icon: Icon(Icons.person),
                ),
              ),

              TextField(
                readOnly: false,
                decoration: InputDecoration(
                  hintText: 'Mobile No.',
                  icon: Icon(Icons.phone_android),
                ),
              ),

              TextField(
                readOnly: false,
                decoration: InputDecoration(
                  hintText: 'Engineer',
                  icon: Icon(Icons.school),
                ),
              ),

              TextField(
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
                      timeinput2.text =
                          formattedTime; //set the value of text field.
                    });
                  } else {
                    print("Time is not selected");
                  }
                },
              ),

              TextField(
                keyboardType: TextInputType.multiline,
                maxLength: null,
                maxLines: 2,
                decoration: InputDecoration(
                    icon: Icon(Icons
                        .local_fire_department), //icon of text field
                    labelText:
                    "Write Resolution here" //label text of field
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
